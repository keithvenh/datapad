class CharacterTalentsController < ApplicationController

  def index
    @character = find_character
    @talents = Talent.all.order(:name)
  end

  def new
    @character = find_character
    @talent = Talent.find(params[:talent_id])
    @character_talent = CharacterTalent.new
  end

  def create
    @character = find_character
    if CharacterTalent.exists?(character: @character, talent: character_talent_params[:talent_id])
      @character_talent = CharacterTalent.find_by(character: @character, talent: character_talent_params[:talent_id])
      if character_talent_params[:purchased] == '1'
        if @character_talent.ranks == nil
          @character_talent.ranks = 1
        else
          @character_talent.ranks += 1
        end
        if @character_talent.save!
          flash[:notice] = "You have successfully added a rank to #{@character_talent.talent.name} to #{@character.name}"
          redirect_to character_path(@character)
        end
      end
    else
      @character_talent = CharacterTalent.new(character_talent_params)
      if @character_talent.save!
        flash[:notice] = "You have successfully added #{@character_talent.talent.name} to #{@character.name}"
        redirect_to character_path(@character)
      else
        flash.now[:alert] = "Beep Boop. Something went wrong."
        render 'new'
      end
    end
  end
  
  private
  
    def character_talent_params
      params.require(:character_talent).permit(:character_id, :talent_id, :purchased, :ranks)
    end

    def find_character
      Character.find(params[:character_id])
    end
  
end
