class CuponsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy, :edit]
  before_action :delete_expired
  before_action :update_expired

  def index; end

  def show; end

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

  def delete_expired
    @cupon = Cupon.where('expiration_date <= ?', Date.today - 15.days)
    @cupon.destroy_all
  end

  def update_expired
    @cupon = Cupon.where('expiration_date <= ?', Date.today)
    @cupon.each do |cupon|
      @cupon.update(image_url: 'https://thumbs.dreamstime.com/b/sello-expirado-122003510.jpg')
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

