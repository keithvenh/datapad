class CharacterSkillsController < ApplicationController

  def new
    @character = find_character
    @skills = Skill.all
    @character_skill = CharacterSkill.new
  end

  def create
    @character = find_character
    @character_skill = CharacterSkill.new(character_skill_params)
    if @character_skill.save!
      flash[:notice] = "You have successfully added #{@character_skill.skill.name} to #{@character.name}. Add another skill!"
      redirect_to new_character_character_skill_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'new'
    end
  end

  def edit
    @character = find_character
    @character_skill = CharacterSkill.find(params[:id])
    @skills = Skill.all
  end

  def update
    @character = find_character
    @character_skill = CharacterSkill.find(params[:id])
    if @character_skill.update(character_skill_params)
      flash[:notice] = "You have successfully updated #{@character_skill.skill.name} for #{@character.name}."
      redirect_to character_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  def destroy
    @character = find_character
    @character_skill = CharacterSkill.find(params[:id])
    flash[:notice] = "You have successfully deleted #{@character_skill.skill.name} from #{@character.name}."
    @character_skill.destroy
      
    redirect_to character_path(@character)
  end
  
  private
  
    def character_skill_params
      params.require(:character_skill).permit(:character_id, :skill_id, :career, :ranks)
    end

    def find_character
      Character.find(params[:character_id])
    end
end
