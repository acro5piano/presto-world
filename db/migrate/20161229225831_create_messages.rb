class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.text :message

      t.timestamps
    end
  end
end
