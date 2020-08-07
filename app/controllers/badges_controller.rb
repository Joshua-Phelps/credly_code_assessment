class BadgesController < ApplicationController

  def new 
    @character = Character.find(params[:character_id])
    # @user = User.find(session[:user_id])
    @user = User.first
    @badge_templates = @user.get_badge_templates
  end 

  def create
    
  end

  def destroy
    
  end

end
