class CharacterSpecTalentsController < ApplicationController
  
  def edit
    @character = find_character
    @character_spec_talent = CharacterSpecTalent.find(params[:id])
  end

  def update
    @character = find_character
    @character_spec_talent = CharacterSpecTalent.find(params[:id])

    if @character_spec_talent.purchased 
      puts "-"*40
      puts "CHARACTER SPEC TALENT PURCHASED = TRUE"
      puts "-"*40
      if character_spec_talent_params[:purchased] == '1'
        if @character_spec_talent.update(character_spec_talent_params)
          flash[:notice] = "You have successfully updated #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}"
          redirect_to @character
        end
      else
        puts "-"*40
        puts "CHARACTER SPEC TALENT PARAMS PURCHASED = FALSE"
        puts "-"*40
        if @character_spec_talent.specialization_talent.talent.ranked
          character_talent = CharacterTalent.find_by(character: @character, talent: @character_spec_talent.specialization_talent.talent)
          character_talent.ranks -= 1
          if character_talent.ranks <= 0 && @character_spec_talent.update(character_spec_talent_params)
            character_talent.destroy
            flash[:alert] = "You have successfully deleted #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}."
            redirect_to @character
          elsif character_talent.save! && @character_spec_talent.update(character_spec_talent_params)
            flash[:notice] = "You have successfully updated #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}"
            redirect_to @character
          else
            flash.now[:alert] = "Beep Boop. Something went wrong."
            render 'edit'
          end
        else
          character_talent = CharacterTalent.find_by(charactre: @character, talent: @character_spec_talent.specialization_talent.talent)
          character_talent.destroy
          flash.now[:alert] = "You have successfully deleted #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}."
          redirect_to @character
        end
      end
    else
      if character_spec_talent_params[:purchased] == '1'
        character_talent = CharacterTalent.find_by(character: @character, talent: @character_spec_talent.specialization_talent.talent)
        if character_talent
          character_talent.ranks += 1
          if character_talent.save! && @character_spec_talent.update(character_spec_talent_params)
            flash[:notice] = "You have successfully updated #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}"
            redirect_to @character
          end
        else
          add_character_talent(@character, @character_spec_talent.specialization_talent.talent)
          if @character_spec_talent.update(character_spec_talent_params)
            flash[:notice] = "You have successfully updated #{@character_spec_talent.specialization_talent.talent.name} for #{@character.name}"
            redirect_to @character
          end
        end
      end
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
