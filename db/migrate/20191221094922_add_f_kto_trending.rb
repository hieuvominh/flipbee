class AddFKtoTrending < ActiveRecord::Migration[6.0]
  def change
    add_column :trendings, :collection_id, :integer, null: false
  end
end
