module IconsHelper
  
  def font_css(id)
     Icon.find(id).icon_css
  end
end
