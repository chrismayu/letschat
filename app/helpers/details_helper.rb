module DetailsHelper
  
  
  
  def trim_url(str)
    str.sub %r{^https?:(//|\\\\)(www\.)?}i, ''
  end
  
  def get_domain(str)
   str =  trim_url(str)
    PublicSuffix.domain(str)
    #get_domain("https://www.facebook.com")
    #get_domain(str)
    
  end
  
  
  
end
