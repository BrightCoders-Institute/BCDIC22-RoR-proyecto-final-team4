class CuponsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  def index; end

  def show();
    @cupon = Cupon.find(params[:id])
    
  end

  def update
    @cupon = Cupon.find(params[:id])
  
    if params[:type] == "increment"
      @cupon.increment!(:punctuation)
    elsif params[:type] == "decrement"
      @cupon.decrement!(:punctuation)
    end
   
    respond_to do |format|
      format.json { render json: { punctuation: @cupon.punctuation } }
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

  private

    def likes_params
      params.require(:cupon).permit(:punctuation)
    end

    def cupon_params
      params.require(:cupon).permit(:url, :title, :description, :location, :image_url, :normal_price, :discount_price, :coupon, :promotion_type, :start_date, :expiration_date)
    end

    def cupon
      @cupon = Cupon.find(params[:id])
    end
end

