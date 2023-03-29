class InteraccionesController < ApplicationController

  def update
    puts 'entre en update insteracciones'
    Interaccione.create!(interacciones_params) if find_user_cupon.nil?
    interacciones = find_user_cupon
    if params[:type] == "increment"
      interacciones.update(like:'like')
      find_cupon.increment!(:punctuation)
    

    elsif params[:type] == "decrement"
      @interacciones.update(like:'dislike')
      find_cupon.decrement!(:punctuation)
 
    end
  end

  private

    def interacciones_params
      params.require(:interacciones).permit(:like, :user_id, :cupon_id)
    end

    def find_user_cupon
        Interaccione.find(params[:user_id, :cupon_id])
    end



    def find_cupon 
      Cupon.find(params[:cupon_id])
    end
  end

end
