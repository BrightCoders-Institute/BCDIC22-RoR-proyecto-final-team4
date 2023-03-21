class MainpagesController < ApplicationController
    def index; 
        @cupon = Cupon.all
    end
end