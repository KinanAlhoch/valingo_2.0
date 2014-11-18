module ApplicationHelper

  def recommended_pals
    User.where('id != ?', current_user.id)
  end
end
