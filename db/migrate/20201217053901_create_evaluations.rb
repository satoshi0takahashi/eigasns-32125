class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :title
      t.string :content
      t.integer :point, null: false
      t.boolean :spoiler, null: false
      t.references :user, null: false, foreign_key: :true
      t.references :movie, null: false, foreign_key: :true
      t.timestamps
    end
  end
end
