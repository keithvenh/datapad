class PagesController < ApplicationController
  def index

    if !@user.has_character?
      flash[:alert] = "You need to create a Player Character to continue."
      redirect_to new_character_path
      @user.has_character = true
    end

    @player_characters = Character.where(type_of: "Player Character").order('name')
    @specialization = Specialization.find_by(name: "Peacekeeper")

  end
end
