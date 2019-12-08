class AddFKtoCardAndCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :user_id, :integer, null: false
    add_column :collections, :user_id, :integer, null: false
  end
end
