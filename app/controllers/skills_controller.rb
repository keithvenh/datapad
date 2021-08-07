class SkillsController < ApplicationController
  
  layout 'admin'

  def index
    @skills = Skill.all.order(:name)
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "You have successfully updated #{@skill.name}."
      redirect_to skills_path
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :attr, :description, :type_of)
    end

end
