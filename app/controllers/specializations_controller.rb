class SpecializationsController < ApplicationController
  
  layout 'admin'

  def index
    @specializations = Specialization.all.order(:name)
  end

  def edit
    @specialization = Specialization.find(params[:id])    
  end

  def update
    @specialization = Specialization.find(params[:id])
    if @specialization.update(specialization_params)
      flash[:notice] = "You have successfully updated #{@specialization.name}."
      redirect_to @specialization
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  def show
    @specialization = Specialization.find(params[:id])
  end

  private

    def specialization_params
      params.require(:specialization).permit(:book_id, :name, :career_id)
    end

end
