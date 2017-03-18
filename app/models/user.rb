class User < ActiveRecord::Base
  has_many :jobs, dependent: :nullify
  has_one :profile

  has_many :applies, dependent: :destroy
  has_many :applied_jobs, through: :applies, source: :job

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

end
