class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
      can :manage, Article, user_id: user.id
      can :manage, Comment
    else
      can :read, Article, Comment
      can [:destroy, :create], Comment, user_id: user.id
    end
    can :read, Notification, user_id: user.id
    can :mark_all_read, Notification
  end
end
