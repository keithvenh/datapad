class SpecializationSkillsController < ApplicationController
  
  layout 'admin'

  def edit
    @specialization = Specialization.find(params[:specialization_id])
    @specialization_skill = SpecializationSkill.find(params[:id])
  end

  def update
    @specialization = Specialization.find(params[:specialization_id])
    @specialization_skill = SpecializationSkill.find(params[:id])
    if @specialization_skill.update(specialization_skill_params)
      flash[:notice] = "You have successfully updated #{@specialization.name}."
      redirect_to @specialization
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def specialization_skill_params
      params.require(:specialization_skill).permit(:specialization_id, :skill_id)
    end

end
