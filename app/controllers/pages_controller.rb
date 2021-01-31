class PagesController < ApplicationController
  def index
    @player_characters = Character.where(type_of: "Player Character")
  end
end
