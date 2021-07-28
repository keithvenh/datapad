class PagesController < ApplicationController
  def index

    if @user.first_login
      flash[:notice] = "Welcome to Datapad! You need to create a Player Character to continue"
      redirect_to new_character_path
      @user.first_login = false
    end
    
    @player_characters = Character.where(type_of: "Player Character").order('name')
    @specialization = Specialization.find_by(name: "Peacekeeper")

  end
end
