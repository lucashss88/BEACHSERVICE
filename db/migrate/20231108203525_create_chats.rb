class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :sender_name
      t.string :receiver_name
      t.text :message
      t.datetime :date
      t.integer :status

      t.timestamps
    end
  end
end
