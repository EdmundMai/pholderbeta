class User < ActiveRecord::Base
  
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :profilepic
  validates_presence_of :password, :on => :create

  validates_format_of :name, :with => /[A-Za-z]+/, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_length_of :password, :minimum => 5, :on => :create

  has_many :ownerships
  has_many :albums, :through => :ownerships 
  accepts_nested_attributes_for :albums

  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at

  has_attached_file :profilepic,
            :storage => :s3,
            :s3_credentials => "#{Rails.root}/config/s3.yml",
            :path => "/:style/:id/:filename"

  before_save { |user| user.email = email.downcase }

  def name_with_initial
    "#{name}"
  end

  def self.search(search)
    where('email LIKE ?', "%#{search}%")
  end


  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
