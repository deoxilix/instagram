class Post < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  validates :image, presence: true

  has_attached_file :image, style: { :medium => "640x640" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
