class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end



#alias_method :edit?, :admin_or_current_user? 
#alias_method :create?, :admin_or_current_user? 
#alias_method :show?, :admin_or_current_user? 
#alias_method :update?, :admin_only?
#alias_method :destroy?, :admin_only?

 end