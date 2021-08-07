class CareerSkillsController < ApplicationController
  
  layout 'admin'

  def edit
    @career = Career.find(params[:career_id])
    @career_skill = CareerSkill.find(params[:id])
  end

  def update
    @career = Career.find(params[:career_id])
    @career_skill = CareerSkill.find(params[:id])
    if @career_skill.update(career_skill_params)
      flash[:notice] = "You have successfully updated #{@career.name}."
      redirect_to @career
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def career_skill_params
      params.require(:career_skill).permit(:career_id, :skill_id)
    end

end
