module ApplicationHelper

  def recommended_pals
   current_user.recommended_pals
  end


  def sender(message)
    User.find(message.sent_messageable_id)
  end

  def languages_list
    [['English', 'English'],['Spanish', 'Spanish'],['Arabic', 'Arabic'],['Russian', 'Russian'],
      ['Japanese', 'Japanese'],['German', 'German'],['French', 'French'],['Urdu', 'Urdu'],['Hindi', 'Hindi']
    ]
  end

  def profile_picture(user)
    if user.picture.blank?
      '/assets/default_pic.jpg'
    else
      user.picture.url
    end
  end

end
