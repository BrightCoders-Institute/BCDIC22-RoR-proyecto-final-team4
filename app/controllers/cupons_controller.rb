class CuponsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  def index; end

  def show
    @cupon = Cupon.find(params[:id])
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

  private

    def cupon_params
      params.require(:cupon).permit(:url, :title, :description, :location, :image_url, :normal_price, :discount_price, :coupon, :promotion_type, :start_date, :expiration_date)
    end

    def cupon
      @cupon = Cupon.find(params[:id])
    end
end

