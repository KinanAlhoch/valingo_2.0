class ChatRoom < ActiveRecord::Base
  belongs_to :user
  validates :token, :uniqueness => true
  has_many :chat_rooms_users
  has_many :users, :through =>  :chat_rooms_users
end
