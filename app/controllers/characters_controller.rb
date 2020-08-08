class CharactersController < ApplicationController
  def index
    @characters = Character.get_badges
    byebug
  end

  def show
    @character = Character.find(params[:id])
    @badges = @character.my_badges

  end

end
