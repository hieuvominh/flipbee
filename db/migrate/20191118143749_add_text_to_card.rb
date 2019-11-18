class AddTextToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :text_front_card, :string
    add_column :cards, :text_back_card, :string
  end
end
