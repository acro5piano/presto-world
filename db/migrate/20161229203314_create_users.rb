class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # basic
      t.string :name, null: false
      t.integer :sex, default: 0, null: false
      t.string :email, null: false
      t.date :birth_day
      t.string :avatar

      # Teacher or student
      t.boolean :is_teacher, default: false, null: false

      # teacher specific
      t.string :educational_background
      t.text :vision
      t.string :strength

      # for OAuth
      t.string :uid # uid may be bigint
      t.string :provider
      t.string :token

      # Shift
      t.boolean :shift_monday_afternoon
      t.boolean :shift_monday_evening
      t.boolean :shift_monday_night
      t.boolean :shift_tuesday_afternoon
      t.boolean :shift_tuesday_evening
      t.boolean :shift_tuesday_night
      t.boolean :shift_wednesday_afternoon
      t.boolean :shift_wednesday_evening
      t.boolean :shift_wednesday_night
      t.boolean :shift_thursday_afternoon
      t.boolean :shift_thursday_evening
      t.boolean :shift_thursday_night
      t.boolean :shift_friday_afternoon
      t.boolean :shift_friday_evening
      t.boolean :shift_friday_night
      t.boolean :shift_saturday_afternoon
      t.boolean :shift_saturday_evening
      t.boolean :shift_saturday_night
      t.boolean :shift_sunday_afternoon
      t.boolean :shift_sunday_evening
      t.boolean :shift_sunday_night

      t.timestamps
    end
  end
end
