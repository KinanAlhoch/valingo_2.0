class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  acts_as_follower
  acts_as_followable
  #  serialize :languages_spoken, Array
  #  serialize :languages_learn, Array

  has_many :home_feeds, :dependent => :destroy
  has_many :chat_rooms_users
  has_many :chat_rooms, :through =>  :chat_rooms_users
  acts_as_messageable :required => [:topic, :body],:class_name => "Message"
  mount_uploader :picture, UserPictureUploader
end
