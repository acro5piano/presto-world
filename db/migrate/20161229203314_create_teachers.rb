class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      # basic
      t.string :name, null: false
      t.string :email, null: false
      t.date :birth_day

      # teacher specific
      t.string :educational_background, null: false
      t.text :vision
      t.string :strength
      t.integer :shift_id

      # for OAuth
      t.integer :uid
      t.string :provider
      t.string :token

      t.timestamps
    end
  end
end
