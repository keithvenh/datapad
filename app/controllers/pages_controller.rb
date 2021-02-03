class PagesController < ApplicationController
  def index
    @player_characters = Character.where(type_of: "Player Character").order('name')
  end
end
