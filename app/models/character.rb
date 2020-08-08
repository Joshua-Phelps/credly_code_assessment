class Character < ApplicationRecord

  def self.all
    byebug
    badges = AcclaimApi.new.get_issued_badges
  end 

  def get_badges
    # get badges for related character
  end 

  def issue_badge(badge_id, name, character_id)
    timestamp = Time.now
    phony_email = character_id.to_s + '@example.com'
    body = {
      recipient_email: phony_email,
      issued_to_first_name: name,
      issued_to_last_name: 'Phelps',
      badge_template_id: badge_id,
      issued_at: timestamp,
      suppress_badge_notification_email: true,
      issuer_earner_id: character_id
    }
    AcclaimApi.new.post_badge(body)
  end 
end
