class Ability
  include CanCan::Ability

  def initialize(user)
    can :modify, PriceNotification, user_id: user.id

    can :modify, User do |u|
        user == u
    end
  end
end
