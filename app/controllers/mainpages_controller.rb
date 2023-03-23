class MainpagesController < ApplicationController
  def index
    @result = params[:search].nil? ? Cupon.all : (params[:search].length > 1 ? find : Cupon.all)
  end

  private

    def find
      result = User.select(:name, :follower).where("name LIKE ?","%" + params[:search].downcase + "%")
      result += Cupon.where("title LIKE ?","%" + params[:search].downcase + "%")
      result
    end
end