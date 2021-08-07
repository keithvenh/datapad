class ForcePowersController < ApplicationController
  
  layout 'admin'

  def index
    @force_powers = ForcePower.all.order(:name)
  end

  def edit
    @force_power = ForcePower.find(params[:id])    
  end

  def update
    @force_power = ForcePower.find(params[:id])
    if @force_power.update(force_power_params)
      flash[:notice] = "You have successfully updated #{@force_power.name}."
      redirect_to @force_power
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  def show
    @force_power = ForcePower.find(params[:id])
  end

  private

    def force_power_params
      params.require(:force_power).permit(:book_id, :name, :downLink1, :downLink2, :downLink3, :downLink4, :force_rating, :cost, :description)
    end

end
