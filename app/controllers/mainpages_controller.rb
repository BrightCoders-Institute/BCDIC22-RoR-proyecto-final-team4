class MainpagesController < ApplicationController
    def index
        @cupon = Cupon.all
        @categories = Category.all
    end
        
    # def category
    #     param = params[:category_id].nil? ? 1 : params[:category_id]
    #     Category.find_by(id: param.to_i)
    # end
end