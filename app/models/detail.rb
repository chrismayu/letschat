class Detail < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :user
  
  
  def slug_candidates
    [
      :name
    ]
  end
  
  
  def self.trim_url(str)
    #str.sub %r{^https?:(//|\\\\)(www\.)?}i, ''
    str.gsub(/str\s*=\s*\Khttps?:\/\/(?:www\.)?/, '')
  end
  
  
   def self.gwet_domain(_link)
      u=URI.parse(_link)

      if (!u.scheme)
          u = "http://" + URI.parse(_link)
          puts "hi"
          u.host
      else
          u.host
      end
     
    end
  
  
  def self.get_domain(str)
    puts "hi5"
    u = URI.parse(str)
    puts "hi4"
    if(!u.scheme)
      puts "hi"
      puts u
        # prepend http:// and try again
         u = "http://" + u
          puts "hi"
          puts u
         u.host
    elsif(%w{http https}.include?(u.scheme))
      puts "hi2"
        u.host
    else
      puts "hi3"
       u = "hi"
    end
     
    #get_domain("https://www.facebook.com")
    #get_domain("https://www.facebook.com/crystal.brownlee.7?hc_ref=NEWSFEED")
    
  end
  
  #uri = URI("https://www.facebook.com/crystal.brownlee.7?hc_ref=NEWSFEED")
  uri = URI("www.facebook.com/crystal.brownlee.7?hc_ref=NEWSFEED")
  
end
