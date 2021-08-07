class CharacterSpecTalentsController < ApplicationController
  
  def edit
    @character = find_character
    @character_spec_talent = CharacterSpecTalent.find(params[:id])
  end

  def update
    @character = find_character
    @character_spec_talent = CharacterSpecTalent.find(params[:id])
    if @character_spec_talent.update(character_spec_talent_params)
      flash[:notice] = "You have successfully updated #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}"
      add_character_talent(@character, @character_spec_talent.specialization_talent.talent)
      redirect_to character_path(@character)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

  def find_character
    Character.find(params[:character_id])
  end

  def character_spec_talent_params
    params.require(:character_spec_talent).permit(:character_id, :specialization_talent_id, :purchased)
  end

  def add_character_talent(character, talent)

    if CharacterTalent.exists?(character: character, talent:talent)
      t = CharacterTalent.find_by(character: character, talent: talent)
      t.ranks += 1
      t.save!
    else
      CharacterTalent.create!(
        character: character,
        talent: talent,
        purchased: true,
        ranks: 1
      )
    end

  end

end
