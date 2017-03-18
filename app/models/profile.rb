class Profile < ActiveRecord::Base
  has_one :user

  validates :description, presence: true
  validates :age, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true
  validates :user_id, uniqueness: true

  mount_uploader :image, ImageUploader
end
