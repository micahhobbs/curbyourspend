class User < ApplicationRecord
  has_many :items
  has_many :comments
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def notify
    expiring_items = items.select { |item| item.end_date == Date.today }
    ItemMailer.notify(self, items).deliver_now #replace items with expiring items
  end

  def self.notify_all_users
    User.all.each do |user|
      user.notify
    end
  end

  def expiring_items
    items.all
  end
end
