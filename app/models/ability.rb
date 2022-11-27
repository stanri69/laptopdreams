# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    return unless user.present?

    if user.seller?
      can :update, Laptop do |lap|
        lap.try(:user) == user
      end
      can :update, :all
      can :read, User
    elsif user.admin?
      can :read, Laptop
      can :create, Laptop
      can :update, Laptop do |lap|
        lap.try(:user) == user
      end
      can :destroy, Laptop do |lap|
        lap.try(:user) == user
      end
      can :manage, :all
    elsif user.guest?
      can :read, Laptop
      can :read, User
    end
  end
end