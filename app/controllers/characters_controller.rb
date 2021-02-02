class CharactersController < ApplicationController

  def index
    @characters = Character.all.order("name")
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save!
      flash[:notice] = "You have successfully created #{@character.name}. Add skills to #{@character.name}"
      create_character_skills(@character)
      redirect_to new_character_character_career_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something Went Wrong."
      render 'new'
    end
  end

  def edit
    @character = find_character
  end

  def update
    @character = find_character
    if @character.update_attributes(character_params)
      flash[:notice] = "You have successfully updated #{@character.name}."
      redirect_to @character
    else
      flash.now[:alert] = "Beep Boop. Something Went Wrong."
      render 'edit'
    end
  end

  def show
    @character = find_character
  end

  def destroy
    @character = find_character
    flash[:alert] = "You have successfully deleted #{@character.name}."
    @character.destroy
    redirect_to characters_url
  end

  private
  
    def character_params
      params.require(:character).permit(:name, :type_of, :wounds, :strain, :soak, :def_ranged, :def_melee, :brawn, :agility, :intellect, :cunning, :willpower, :presence, :force_rating, :species)
    end

    def find_character
      Character.find(params[:id])
    end

    def create_character_skills(character)
      skills = Skill.all
      skills.each do |skill|
        CharacterSkill.create!(character: character, skill: skill, career: false, ranks: 0)
      end
    end
end
