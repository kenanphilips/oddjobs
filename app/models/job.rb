class Job < ActiveRecord::Base

  has_many :applies, dependent: :destroy
  has_many :users, through: :applies

  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :address, presence: true
  validates :wage, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: false

  validate :end_date_is_after_start_date

  geocoded_by :address
  after_validation :geocode

  def applied_by?(user)
    applies.exists?(user: user)
  end

  def apply_for(user)
    applies.find_by_user_id user
  end

  def self.search(search)
    where("title ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be earlier the start date")
    end
  end

end
