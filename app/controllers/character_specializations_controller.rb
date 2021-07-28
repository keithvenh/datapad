class CharacterSpecializationsController < ApplicationController
  
  def new
    @character = find_character
    @character_career = CharacterCareer.where(character: @character).first
    @specializations = Specialization.all.order('name')
    @character_specialization = CharacterSpecialization.new
  end

  def create
    @character = find_character
    @character_specialization = CharacterSpecialization.new(character_specialization_params)
    if @character_specialization.save!
      flash[:notice] = "You have successfully added #{@character_specialization.specialization.name} to #{@character.name}"
      update_character_career_skills(@character, @character_specialization.specialization)
      add_character_specialization_talents(@character, @character_specialization.specialization)
      redirect_to character_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'new'
    end
  end

  def show
    @character = find_character
    @character_specialization = CharacterSpecialization.find(params[:id])
  end

  def edit
    @character = find_character
    @character_specialization = CharacterSpecialization.find(params[:id])
    @specializations = Specialization.all.order(:name)
  end

  def update
    @character = find_character
    @character_specialization = CharacterSpecialization.find(params[:id])
    if @character_specialization.update(character_specialization_params)
      flash[:notice] = "You have successfully updated #{@character_specialization.specialization.name} for #{@character.name}."
      redirect_to character_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  def destroy
    @character = find_character
    @character_specialization = CharacterSpecialization.find(params[:id])
    flash[:notice] = "You have successfully deleted #{@character_specialization.specialization.name} from #{@character.name}."
    @character_specialization.destroy
      
    redirect_to character_path(@character)
  end
  
  private
  
    def character_specialization_params
      params.require(:character_specialization).permit(:character_id, :specialization_id)
    end

    def find_character
      Character.find(params[:character_id])
    end

    def update_character_career_skills(character, specialization)

      specialization.specialization_skills.each do |skill|
        character_skill = CharacterSkill.find_by(character: character, skill: skill.skill)
        character_skill.career = true
        character_skill.save!
      end

    end

    def add_character_specialization_talents(character, specialization)

      specialization.specialization_talents.each do |spec_talent|

        CharacterSpecTalent.create!(
          character: character,
          specialization_talent: spec_talent,
          purchased: false
        )

      end

    end

end
