class Ability
  include CanCan::Ability

  def initialize(userOrAdmin)
    if userOrAdmin.role == 'admin'
      can :manage, :all
      # else
      #   can :destroy, Post do |post|
      #     post.author == user
      #   end

      #   can :destroy, Comment do |comment|
      #     comment.author == user
      #   end

      #   can :create, Post
      #   can :create, Comment

      # can :read, Post, public: true

      # return unless user.present? # additional permissions for logged in users (they can read their own posts)

      # can :read, :all
      # can :manage, Post, user: user
      # can :manage, Comment, user: user

      # return unless user.role == 'current_admin' # additional permissions for administrators

      # can :manage, :all
    end
  end
end
