class Photo < ActiveRecord::Base
  attr_accessible :avatar
  belongs_to :album

  has_attached_file :avatar, :styles => { :small => "150x150>", :medium => "300x300>"},
              		:storage => :s3,
     				:s3_credentials => "#{Rails.root}/config/s3.yml",
     				:path => "/:style/:id/:filename"
              		

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end
