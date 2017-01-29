class CreateUsersShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :users_shifts do |t|
      t.integer :user_id
      t.integer :shift_id

      t.timestamps
    end
  end
end
