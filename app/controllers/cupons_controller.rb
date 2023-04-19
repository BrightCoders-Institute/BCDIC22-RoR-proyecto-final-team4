class CuponsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  before_action :set_cupon, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
    @cupon = Cupon.find(params[:id])
    @followed = users_followed if current_user
    img
    porcentaje
  end

  def new
    @cupon = Cupon.new
  end

  def create
    @cupon = current_user.cupons.new(cupon_params)
    
    if @cupon.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cupon = Cupon.find(params[:id])
  end

  def destroy
    @cupon = Cupon.find(params[:id])
    @cupon.destroy
  end

  def update
    if request.patch?
      if params[:type] == "increment"
        unless voted?
          @cupon.increment!(:punctuation)
          create_or_update_vote(true)
        else
          vote = Vote.find_by(user_id: current_user.id, cupon_id: @cupon.id)
          if vote.voted == false
            @cupon.increment!(:punctuation, 1)
            vote.update(voted: true)
          end
        end
        respond_to do |format|
          format.json { render json: { punctuation: @cupon.punctuation } }
        end
      elsif params[:type] == "decrement"
        continue_execution = true
        unless voted?
          @cupon.decrement!(:punctuation)
          if @cupon.punctuation <= -10
            @cupon.destroy
            redirect_to root_path, alert: "El cupón #{@cupon[:title]} ha sido eliminado porque su puntuación es igual o menor que -10"
            continue_execution = false
          end
        else
          vote = Vote.find_by(user_id: current_user.id, cupon_id: @cupon.id)
          if vote.voted == true
            @cupon.decrement!(:punctuation, 1)
            vote.update(voted: false)
          end
        end
        if continue_execution
          respond_to do |format|
            format.json { render json: { punctuation: @cupon.punctuation } }
          end
        end
      else
        if @cupon.update(cupon_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end
  
  private
  
  def create_or_update_vote(voted)
    vote = Vote.find_by(user_id: current_user.id, cupon_id: @cupon.id)
  
    if vote.nil?
      Vote.create(user_id: current_user.id, cupon_id: @cupon.id, voted: true)
    elsif vote.voted == voted
      
    else
      vote.update(voted: voted)
    end
  end
  
  def voted?
    Vote.exists?(user_id: current_user.id, cupon_id: @cupon.id)
  end
  
    def users_followed
      result = current_user.follower&.split(",")&.map(&:to_i)
      (result.nil?) ? [] : result
    end
    
    def set_cupon
      begin
        @cupon = Cupon.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path
      end
    end

    def cupon_params
      params.require(:cupon).permit(:url, :title, :description, :location, :image_url, :normal_price, :discount_price, :coupon, :promotion_type, :start_date, :expiration_date, :category_id)
    end

    def cupon
      @cupon = Cupon.find(params[:id])
    end

    def img
      if 
        cupon.image_url == ""
        @cupon.image_url = "/assets/coupon_defaul-f44b2a800def72f7969c4ecbfc178de784ff728aa337740e588a3c2ab8ec5bb1.webp"
      end 
    end

    def porcentaje
      if @cupon.discount_percentage.nil? && @cupon.normal_price.present? && @cupon.discount_price.present?
        @subtraction = (@cupon.normal_price.to_i - @cupon.discount_price.to_i)
        @mount = (@subtraction.to_f / @cupon.normal_price.to_f)
        @percentage = (@mount * 100).to_i
        @cupon.discount_percentage = @percentage
      end
    end
end

