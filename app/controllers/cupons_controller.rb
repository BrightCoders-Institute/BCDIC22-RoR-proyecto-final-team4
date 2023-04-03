class CuponsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  before_action :set_cupon, only: [:show, :edit, :update, :destroy, :set_punctuation]
  def index
    @categories = Category.all
    
  end

  def show
    @cupon = Cupon.find(params[:id])
    @followed = users_followed if current_user
    img
    porcentaje
  end

  def update
    if request.patch?
      if params[:type] == "increment"
        if !voted?(1)
          @cupon.increment!(:punctuation)
          set_voted_cookie(1)
        end
        respond_to do |format|
          format.json { render json: { punctuation: @cupon.punctuation } }
        end
      elsif params[:type] == "decrement"
        if !voted?(-1)
          @cupon.decrement!(:punctuation)
          set_voted_cookie(-1)
        end
        respond_to do |format|
          format.json { render json: { punctuation: @cupon.punctuation } }
        end
      else
        if @cupon.update(cupon_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end
    else
      redirect_to root_path
    end
  end

  def set_punctuation
    if params[:type] == "increment"
      if !voted?(1)
        @cupon.increment!(:punctuation)
        set_voted_cookie(1)
      end
    elsif params[:type] == "decrement"
      if !voted?(-1)
        @cupon.decrement!(:punctuation)
        set_voted_cookie(-1)
      end
    end
    redirect_to @cupon
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

  private
  
    def users_followed
      result = current_user.follower&.split(",")&.map(&:to_i)
      (result.nil?) ? [] : result
    end
    
  def set_cupon
    @cupon = Cupon.find(params[:id])
  end

  def voted?(value)
    voted = cookies.signed[@cupon.id] || 0
    if voted == value
      return true
    else
      return false
    end
  end

    def set_voted_cookie(value)
      cookies.signed[@cupon.id] = value
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

