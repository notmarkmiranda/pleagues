class MembershipPolicy < ApplicationPolicy
  def show?
    record.user.id == user.id
  end

  def destroy?
    role = user.role_in_league(record.league)
    role == "admin" || role == "superadmin"
  end

  def accept?
    record.user.id == user.id
  end

  def reject?
    record.user.id == user.id
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
