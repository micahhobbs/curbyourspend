class AddPurchasedToItemsModel < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :purchased, :boolean
  end
end
