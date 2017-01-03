class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sent_user_id
      t.integer :received_user_id
      t.text :message

      t.timestamps
    end
  end
end
