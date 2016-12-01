class IconPolicy < ApplicationPolicy
  
  alias_method :index?, :admin_or_current_user? 
  alias_method :new?, :admin_or_current_user?  
  alias_method :edit?, :admin_or_current_user? 
  alias_method :create?, :admin_or_current_user? 
  alias_method :show?, :admin_or_current_user? 
  alias_method :update?, :admin_or_current_user? 
 
 end
