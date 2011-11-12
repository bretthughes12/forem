require 'cancan'

module Forem
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new # anonymous user

      if user.can_read_forums?
        can :read, Forem::Forum do |forum|
          user.can_read_forum?(forum)
        end
      end
    end
  end
end