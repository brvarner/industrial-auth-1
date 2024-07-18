class UsersController < ApplicationController
  before_action :set_user, only: %i[show liked followers following discover feed]
  before_action :correct_user_feed, only: %i[feed]
  before_action :correct_user_discover, only: %i[discover]
  before_action { authorize @user || User }
  
  
  private

  def set_user
    @user = User.find_by!(username: params[:username]) if params[:username]
  end

  def correct_user_feed
    redirect_to feed_path(current_user.username) unless current_user == @user
  end

  
  def correct_user_discover
    redirect_to discover_path(current_user.username) unless current_user == @user
  end
end
