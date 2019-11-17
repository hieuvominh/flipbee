class AddColumnToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :title, :string
    add_column :collections, :description, :string
    add_column :collections, :thumb_image_url, :string
  end
end
