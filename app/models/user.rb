class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :similiarity_count

  acts_as_follower
  acts_as_followable
  validates :name, :presence => true
  validates :sex, :presence => true
  #  serialize :languages_spoken, Array
  #  serialize :languages_learn, Array

  has_many :home_feeds, :dependent => :destroy
  has_many :chat_rooms_users
  has_many :chat_rooms, :through =>  :chat_rooms_users
  acts_as_messageable :required => [:topic, :body],:class_name => "Message"
  mount_uploader :picture, UserPictureUploader

  def feeds
    user_ids = self.followers(User).map(&:id)
    user_ids << self.id
    HomeFeed.where('user_id IN (?)', user_ids).order('created_at desc')
  end

  def recommended_pals
    users_to_be_added = []
    if self.languages_spoken.blank? || self.languages_learn.blank?
      users_to_be_added
    else
      already_friends_ids = self.followers(User).map(&:id)
      already_friends_ids << self.id
      available_users = User.where('id NOT IN (?)', already_friends_ids)
      available_users.each do |user|
	if user.languages_spoken.blank? || user.languages_learn.blank?
	  users_to_be_added << user
	else
	  count= (self.languages_spoken.split(',') & user.languages_learn.split(',')).size + (self.languages_learn.split(',') & user.languages_spoken.split(',')).size
	  user.similiarity_count = count
	  users_to_be_added << user
	  if users_to_be_added[0].similiarity_count < count
	    temp = users_to_be_added[0]
	    users_to_be_added[0] = user
	    users_to_be_added = users.to_be_added.pop
	    users_to_be_added << temp
	  end
	end
      end
      users_to_be_added
    end
  end
end
