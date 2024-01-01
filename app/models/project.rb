class Project < ApplicationRecord
  belongs_to :user
  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :details, presence: true
  validates :poster_img, presence: true
  validates :technologies, presence: true
  validates :features, presence: true
  validates :images, presence: true
  validates :github_link, format: { with: %r{\Ahttps?://\S+\z}, allow_blank: true }
  validates :live_link, format: { with: %r{\Ahttps?://\S+\z}, allow_blank: true }

  # Serializations with explicit coder
  serialize :technologies, Array, coder: JSON
  serialize :features, Array, coder: JSON
  serialize :images, Array, coder: JSON
end
