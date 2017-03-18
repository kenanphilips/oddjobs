class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :job


  validates :user_id, uniqueness: {scope: :job_id}
end
