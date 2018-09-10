class GroupPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # index authorization is performed in the ChurchPolicy :giving_types?

  def show?
    user.church_id == record.church_id
  end

  def new?
    create?
  end

  def create?
    user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def update?
    user.church_id == record.church_id && user.has_role?(:admin)
  end

  def destroy?
    user.church_id == record.church_id && user.has_role?(:admin)
  end
end