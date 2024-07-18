class LikePolicy < ApplicationPolicy
  attr_reader :user, :like, :photo

  def initialize(user, like, photo)
    @user = user
    @like = like
    @photo = photo
  end

  def index?
    false
  end

  def show?
    false
  end

  def new?
    false
  end

  def edit?
    false
  end

  def create?
    true
  end

  def update?
    user == like.fan
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(fan: user)
    end
  end
end
