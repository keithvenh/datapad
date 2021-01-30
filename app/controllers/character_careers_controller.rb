class CharacterCareersController < ApplicationController

  def new
    @character = find_character
    @careers = Career.all.order('name')
    @character_career = CharacterCareer.new
  end

  def create
    @character = find_character
    @character_career = CharacterCareer.new(character_career_params)
    if @character_career.save!
      flash[:notice] = "You have successfully added #{@character_career.career.name} to #{@character.name}"
      update_character_career_skills(@character, @character_career.career)
      redirect_to new_character_character_specialization_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'new'
    end
  end

  def edit
    @character = find_character
    @character_career = CharacterCareer.find(params[:id])
    @careers = Career.all
  end

  def update
    @character = find_character
    @character_career = CharacterCareer.find(params[:id])
    if @character_career.update_attributes(character_career_params)
      flash[:notice] = "You have successfully updated #{@character_career.career.name} for #{@character.name}."
      redirect_to character_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  def destroy
    @character = find_character
    @character_career = CharacterCareer.find(params[:id])
    flash[:notice] = "You have successfully deleted #{@character_career.career.name} from #{@character.name}."
    @character_career.destroy
      
    redirect_to character_path(@character)
  end
  
  private
  
    def character_career_params
      params.require(:character_career).permit(:character_id, :career_id)
    end

    def find_character
      Character.find(params[:character_id])
    end

    def update_character_career_skills(character, career)

      career.career_skills.each do |skill|
        character_skill = CharacterSkill.find_by(character:character, skill: skill.skill)
        character_skill.career = true
        character_skill.save!
      end

    end

end
