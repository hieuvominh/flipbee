class AddColumnToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :image_front_card, :string
    add_column :cards, :image_back_card, :string
    add_column :cards, :description, :string
    add_column :cards, :collection_id, :integer, :null => true
  end
end
