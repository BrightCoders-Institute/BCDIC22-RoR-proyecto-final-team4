class MainpagesController < ApplicationController
  before_action :authenticate_user!, only:[:update]
  before_action :delete_expired
  before_action :update_expired

  def index
    @cupons = Cupon.all.sort_by(&:punctuation_with_default).reverse.take(3)
    if params[:home]
      if params[:cupon]
        @result = user_cupons
      elsif params[:following]
        @result = user_following
      end
    elsif params[:users]
      @result = all_users
    else
      if params[:category_id].nil?
        @result = params[:search].nil? ? Cupon.all : (params[:search].length > 1 ? find : Cupon.all)
      else
        @result = find_by_category
      end
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
      redirect_to root_path(users: true) unless params[:users].nil?
      # redirect_to cupon_path(cupon: true, following: true) unless params[:id].nil?
      # @cupon = Cupon.find(params[:id])
      redirect_to cupon_path(params[:id_cupon]) unless params[:id_cupon].nil?
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

    def find_by_category
      Cupon.where(category_id: params[:category_id])
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
      result = current_user.follower&.split(",")&.map(&:to_i)
      (result.nil?) ? [] : result
    end

    def all_users
      User.all.select(:id, :name)
    end
  
    def add_follower
      following = current_user.follower
      current_user.update(follower: "#{following},#{params[:id]}")
    end
  
    def remove_follower
      follow = users_followed.to_a
      follow.delete(params[:id].to_i)
      follow.delete(0)
      current_user.update(follower: "#{(follow == params[:id].to_i) ? '' : follow.to_s.tr!('[] ','')}")
    end  
end
  