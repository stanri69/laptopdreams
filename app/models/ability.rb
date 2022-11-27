# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.seller?
      can :update, Laptop do |lap|
        lap.try(:user) == user
      end
      can :manage, :all
    elsif user.admin?
      can :read, Laptop
      can :create, Laptop
      can :update, Laptop do |lap|
        lap.try(:user) == user
      end
      can :destroy, Laptop do |lap|
        lap.try(:user) == user
      end
    elsif user.guest?
      can :read, Laptop
    end
  end
end
