class Character < ApplicationRecord

  def self.all_badges
    badges = AcclaimApi.new.get_issued_badges
  end 

  def my_badges
    badges = AcclaimApi.new.get_badges_by_character(self.id)
  end 

  def self.get_badges
    # get badges for related character
    characters = Character.all
    badges = Character.all_badges
    badges.each do |badge|
      byebug
    end 
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
