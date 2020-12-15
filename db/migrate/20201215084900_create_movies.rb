class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.date :release_date, null: false
      t.boolean :like
      t.timestamps
    end
  end
end
