class CuponsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy, :edit]
  
  def index
    @categories = Category.all
  end

  def show
    @cupon = Cupon.find(params[:id])
    if img && porcentaje
      img
      porcentaje
    end
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

  def update
    @cupon = Cupon.find(params[:id])
    @cupon.update(cupon_params)

    redirect_to root_path
  end

  def destroy
    @cupon = Cupon.find(params[:id])
    @cupon.destroy
  end

  private
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
      if @cupon.discount_percentage.nil?
        @subtraction = (@cupon.normal_price.to_i - @cupon.discount_price.to_i)
        @mount = (@subtraction.to_f / @cupon.normal_price.to_f)
        @percentage = (@mount * 100).to_i
        @cupon.discount_percentage = @percentage
        puts @cupon.discount_percentage
      end
    end
end

