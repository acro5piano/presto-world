class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :student_id
      t.integer :star
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
