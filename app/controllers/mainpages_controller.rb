class MainpagesController < ApplicationController
  before_action :authenticate_user!, only:[:update]
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
      @result = params[:search].nil? ? Cupon.all : (params[:search].length > 1 ? find : Cupon.all)
    end
    @followed = users_followed if current_user
  end

  def update
    unless users_followed.include? params[:id].to_i
      add_follower
    else
      remove_follower
    end
    render_layout
  end

  private
    def render_layout
      redirect_to root_path(search: params[:search]).to_s unless params[:search].nil?
      redirect_to root_path(home: true, following: true) unless params[:following].nil?
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
    
    def find
      result = User.select(:id, :name).where("name LIKE ?","%" + params[:search].downcase + "%")
      result += Cupon.where("title LIKE ?","%" + params[:search].downcase + "%")
      result
    end
    
    def user_cupons
      Cupon.all.where(user: current_user.id)
    end
    
    def user_following
      User.all.where(id: users_followed)
    end
    
    def users_followed
      current_user.follower&.split(",")&.map(&:to_i)
    end
  
    def add_follower
      following = current_user.follower
      current_user.update(follower: "#{following},#{params[:id]}")
    end
  
    def remove_follower
      following = users_followed.delete(params[:id].to_i)
      current_user.update(follower: "#{(following == params[:id].to_i) ? '' : following.to_s}")
    end
end
  