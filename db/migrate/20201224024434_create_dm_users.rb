class CreateDmUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_users do |t|
      t.references :dm, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
