class ChurchPolicy < ApplicationPolicy
  attr_reader :user, :church

  def initialize(user, church)
    @user = user
    @church = church
  end

  def index?
    user.has_role?(:super_admin)
  end

  def show?
    user.church_id == church.id
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    user.church_id == church.id && user.has_role?(:admin)
  end

  def destroy?
    user.church_id == church.id && user.has_role?(:admin)
  end

  def nested_resources?
    user.church_id == church.id
  end
end