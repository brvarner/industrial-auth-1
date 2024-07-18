class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
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
    user == follow_request.sender || follow_request.recipient
  end

  def destroy?
    update?
  end

  



  class Scope < Scope
    def resolve
      scope.where(sender: user).or(scope.where(recipient: user))
    end
  end
end
