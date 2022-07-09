class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :reason, inclusion: { in: ['Fun', 'Fitness', 'Productivity', 'Technology', 'Other'] }
end
