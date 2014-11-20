module ApplicationHelper

  def recommended_pals
    already_friends_ids = current_user.followers(User).map(&:id)|| []
    User.where('id != ? AND id NOT IN (?)', current_user.id, already_friends_ids)
  end
end
