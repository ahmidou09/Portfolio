class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: { user: 0, admin: 1 }

  def admin?
    role == 'admin'
  end
end
