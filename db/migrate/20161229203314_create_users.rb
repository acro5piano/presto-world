class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # basic
      t.string :name, null: false
      t.boolean :gender, default: 0, null: false
      t.string :email, null: false
      t.date :birth_day

      # Teacher or student
      t.boolean :is_teacher, default: 0, null: false

      # teacher specific
      t.string :educational_background
      t.text :vision
      t.string :strength
      t.integer :shift_id

      # for OAuth
      t.string :uid # uid may be bigint
      t.string :provider
      t.string :token

      t.timestamps
    end
  end
end
