class User < ActiveRecord::Base
  extend FriendlyId
  attachment :profile_image
  friendly_id :slug_candidates, use: :slugged
  enum role: [:user, :vip, :admin]
  after_save :set_detail


  acts_as_taggable
  
  searchkick text_start: [:first_name, :last_name,:name, ], suggest: [:title], settings: {index: {max_result_window: 10000}}
 
    def search_data
      {
        first_name: first_name,
        last_name: last_name,
        name: name,
        tag_list: tag_list
      }
    end
  
  validates_presence_of :name, :first_name, :last_name
  validates_format_of :name, :with => /\A[A-Za-z0-9-]+\z/, :message => 'The name can only contain alphanumeric characters and dashes.', :allow_blank => true
  validates_uniqueness_of :name, :case_sensitive => false, :message => "  is already in use"
  validates_exclusion_of :name, :in => %w( tester support blog www billing help api ), :message => "The name <strong>{{value}}</strong> is reserved and unavailable."

  before_validation :downcase_name


 
  attachment :profile_image, content_type: ["image/jpeg", "image/png", "image/gif"]
 
 
  has_one :detail
 
  scope :names, -> (id) { where(:id => id).select( :profile_image_id, :first_name, :last_name, :email) }
    # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name
    ]
  end


  def self.front_page
    
    user = User.all
  end

  def to_param
    name
  end

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable
   

     private

     def set_detail
       
       self.build_detail(:name => self.name, :details_email => self.email) unless self.detail.present?
       
       self.detail.save
     end   
   
  
     protected

   def downcase_name
     self.name.downcase! if attribute_present?("name")
   end 
   
   end
