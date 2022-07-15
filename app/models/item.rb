class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :reason, inclusion: { in: ['Fun', 'Fitness', 'Productivity', 'Technology', 'Other'] }
  alias_attribute :start_time, :start_date # (new_name, old_name) to fix issue with Simple Cal

  def self.send_emails
    User.all.each do |user|
      items_expiring_today = user.items.select { |item| item.end_date == Date.today }
      user = User.find(2)
      items = user.items
      p user.email
      p items
      ItemMailer.notify(user, items).deliver_now
    end
  end
end
