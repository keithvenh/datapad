class PagesController < ApplicationController
  def index
    @player_characters = Character.where(type_of: "Player Character").order('name')
    @specialization = Specialization.find_by(name: "Peacekeeper")
  end
end
