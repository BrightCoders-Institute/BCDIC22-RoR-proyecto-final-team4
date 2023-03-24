class MainpagesController < ApplicationController
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
  end

  private
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

