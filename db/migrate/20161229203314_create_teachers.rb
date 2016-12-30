class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :educational_background, null: false
      t.text :vision
      t.string :strength
      t.integer :shift_id

      t.timestamps
    end
  end
end
