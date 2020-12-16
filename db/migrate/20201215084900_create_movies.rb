class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :release_date_id
      t.integer :country_id
      t.integer :like
      t.timestamps
    end
  end
end
