class SpecializationTalentsController < ApplicationController

    layout 'admin'

  def edit
    @specialization = Specialization.find(params[:specialization_id])
    @specialization_talent = SpecializationTalent.find(params[:id])
  end

  def update
    @specialization = Specialization.find(params[:specialization_id])
    @specialization_talent = SpecializationTalent.find(params[:id])
    if @specialization_talent.update(specialization_talent_params)
      flash[:notice] = "You have successfully updated #{@specialization.name}."
      redirect_to @specialization
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def specialization_talent_params
      params.require(:specialization_talent).permit(:specialization_id, :talent_id, :row, :colStart, :colSpan, :upLink, :downLink, :leftLink, :rightLink, :cost)
    end

end
