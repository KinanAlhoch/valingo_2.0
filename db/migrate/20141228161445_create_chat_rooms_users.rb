class CreateChatRoomsUsers < ActiveRecord::Migration
  def change
    create_table :chat_rooms_users do |t|

      t.integer :user_id
      t.integer :chat_room_id
      t.timestamps
    end
  end
end
