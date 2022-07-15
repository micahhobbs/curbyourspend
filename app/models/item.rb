class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :reason, inclusion: { in: ['Fun', 'Fitness', 'Productivity', 'Technology', 'Other'] }
  alias_attribute :start_time, :start_date # (new_name, old_name) to fix issue with Simple Cal
end
