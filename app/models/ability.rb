# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(member)
    if member && member.admin_flg?
      can :access, :rails_admin
      can :manage, :all
    elsif member
      can :manage, Post, Artist, Comment, Favorite, Member
    end
  end
end
