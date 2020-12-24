class CreateDmUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_users do |t|

      t.timestamps
    end
  end
end
