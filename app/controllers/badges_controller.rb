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
    @character = Character.find(params[:character_id])
    if @character 
       badge = @character.issue_badge(params[:badge_id], @character.name, @character.id) 
       badge && redirect_to character_path(@character)
    else
      flash[:message] = "Something Went Wrong! Please Try Again."
      render :new
    end 
  end

  def destroy
    
  end

  private

  def badges_params
    require(:badge).permit(:character_id, :id)
  end 

end
