class AddTitleToGenre < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :title, :string
  end
end
