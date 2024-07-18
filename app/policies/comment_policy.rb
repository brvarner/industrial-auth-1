class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
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
    user == comment.author
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(author: user)
    end
  end
end
