class BadgesController < ApplicationController

  def show
    
  end

  def new 
    @character = Character.find(params[:character_id])
    # @user = User.find(session[:user_id])
    @user = User.first
    @badge_templates = @user.get_badge_templates
  end 

  def create
    byebug
    @character = Character.find(params[:character_id])
    if @character 
       @character.add_badge(params[:badge_id]) 
    else

    end 
  end

  def destroy
    
  end

  private

  def badges_params
    require(:badge).permit(:character_id, :id)
  end 

end
