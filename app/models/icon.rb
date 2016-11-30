class Icon < ActiveRecord::Base
  belongs_to :detail
  
  
   scope :icon, -> (id) { where(:id => id).select( :icon_css) }
   scope :top,  -> { where(:top_icons => true) }
   
   def self.dropdown
    dropdown = [["", Icon.top], ["", Icon.all]] 
   end
   
   
   
end
