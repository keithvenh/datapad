class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save!
      redirect_to @character
    else
      render 'new'
    end
  end

  def edit
    @character = find_character
  end

  def update
    @character = find_character
    if @character.update_attributes(character_params)
      redirect_to @character
    else
      render 'edit'
    end
  end

  def show
    @character = find_character
  end

  def destroy
    find_character.destroy
    redirect_to characters_url
  end

  private
  
    def character_params
      params.require(:character).permit(:name, :type_of, :wounds, :strain, :soak, :def_ranged, :def_melee, :brawn, :agility, :intellect, :cunning, :willpower, :presence, :force_rating)
    end

    def find_character
      Character.find(params[:id])
    end
end
