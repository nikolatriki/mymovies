class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.float :rating
      t.float :expert_rating
      t.boolean :watched

      t.timestamps
    end
  end
end
