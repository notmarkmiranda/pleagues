class MembershipPolicy < ApplicationPolicy
  def show?
    record.user.id == user.id
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
