class CreateChatRooms < ActiveRecord::Migration
  def change
    create_table :chat_rooms do |t|

      t.integer :user_id
      t.string :token
      t.boolean :expired, :default => false
      t.timestamps
    end
  end
end
