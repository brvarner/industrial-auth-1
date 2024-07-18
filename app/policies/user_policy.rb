class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    false
  end

  def new?
    false
  end

  def edit?
    user == current_user
  end

  def show?
   true
  end

  def liked?
   show?
  end

  def followers?
   show?
  end

  def following?
   show?
  end

  def discover?
   show?
  end

  def feed?
   show?
  end

  def show_photo?
   user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end
end
