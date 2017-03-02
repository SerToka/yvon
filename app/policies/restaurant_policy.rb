class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user || user.admin
  end

  def update?
    edit?
  end

  def refresh?
    edit?
  end

  def duty_update?
    edit?
  end

  def preparation_time_update?
    edit?
  end
end
