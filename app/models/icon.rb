class Icon < ActiveRecord::Base
  belongs_to :detail
  
  
   scope :icon, -> (id) { where(:id => id).select( :icon_css) }
end
