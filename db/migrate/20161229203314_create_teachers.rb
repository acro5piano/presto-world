class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :age
      t.string :educational_background
      t.string :vision
      t.string :strength
      t.integer :shift_id

      t.timestamps
    end
  end
end
