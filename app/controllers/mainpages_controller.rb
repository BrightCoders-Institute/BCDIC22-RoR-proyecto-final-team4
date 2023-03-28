class MainpagesController < ApplicationController
  before_action :delete_expired
  before_action :update_expired

  def index
    if params[:home]
      if params[:cupon]
        @result = user_cupons
      elsif params[:following]
        @result = user_following
      end
    else
      if params[:category_id].nil?
        @result = params[:search].nil? ? Cupon.all : (params[:search].length > 1 ? find : Cupon.all)
      else
        @result = find_by_category
      end
    end
  end

  private
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


    def find_by_category
      Cupon.where(category_id: params[:category_id])
    end

    def find
      result = User.select(:name, :follower).where("name LIKE ?","%" + params[:search].downcase + "%")
      result += Cupon.where("title LIKE ?","%" + params[:search].downcase + "%")
      result
    end

    def user_cupons
      Cupon.all.where(user: current_user.id)
    end

    def user_following
      follower = current_user.follower&.split(",")&.map(&:to_i)
      User.all.where(id: follower)
    end
        
end

