class CharacterForcePowerUpgradesController < ApplicationController
  

  def edit
    @character = find_character
    @character_force_power_upgrade = CharacterForcePowerUpgrade.find(params[:id])
  end

  def update
    @character = find_character
    @character_force_power_upgrade = CharacterForcePowerUpgrade.find(params[:id])
    @character_force_power = CharacterForcePower.find_by(character: @character, force_power: @character_force_power_upgrade.force_power_upgrade.force_power)
    if @character_force_power_upgrade.update(character_force_power_upgrade_params)
      flash[:notice] = "You have successfully updated #{@character_force_power_upgrade.force_power_upgrade.name} for #{@character.name}"
      redirect_to character_character_force_power_path(@character, @character_force_power)
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

  def find_character
    Character.find(params[:character_id])
  end

  def character_force_power_upgrade_params
    params.require(:character_force_power_upgrade).permit(:character_id, :force_power_upgrade_id, :purchased)
  end

end
