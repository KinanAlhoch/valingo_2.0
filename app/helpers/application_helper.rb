module ApplicationHelper

  def recommended_pals
    already_friends_ids = current_user.followers(User).map(&:id)
    already_friends_ids << current_user.id
    User.where('id NOT IN (?)', already_friends_ids)
  end


  def sender(message)
    User.find(message.sent_messageable_id)
  end

end
