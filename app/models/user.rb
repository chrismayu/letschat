class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?


  validates_presence_of :name, :first_name, :last_name
  validates_format_of :name, :with => /\A[A-Za-z0-9-]+\z/, :message => 'The name can only contain alphanumeric characters and dashes.', :allow_blank => true
  validates_uniqueness_of :name, :case_sensitive => false, :message => "  is already in use"
  validates_exclusion_of :name, :in => %w( tester support blog www billing help api ), :message => "The name <strong>{{value}}</strong> is reserved and unavailable."

  before_validation :downcase_name



  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name
    ]
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
   
   
   
     protected

   def downcase_name
     self.name.downcase! if attribute_present?("name")
   end 
   
   end
