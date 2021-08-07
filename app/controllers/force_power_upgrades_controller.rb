class ForcePowerUpgradesController < ApplicationController
  
  layout 'admin'

  def edit
    @force_power = ForcePower.find(params[:force_power_id])
    @force_power_upgrade = ForcePowerUpgrade.find(params[:id])
  end

  def update
    @force_power = ForcePower.find(params[:force_power_id])
    @force_power_upgrade = ForcePowerUpgrade.find(params[:id])
    if @force_power_upgrade.update(force_power_upgrade_params)
      flash[:notice] = "You have successfully updated #{@force_power.name}."
      redirect_to @force_power
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def force_power_upgrade_params
      params.require(:force_power_upgrade).permit(:force_power_id, :name, :row, :colStart, :colSpan, :upLink1, :upLink2, :upLink3, :upLink4, :downLink1, :downLink2, :downLink3, :downLink4, :leftLink, :rightLink, :cost, :description)
    end

end
