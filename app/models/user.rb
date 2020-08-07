class User < ApplicationRecord
  has_secure_password

  def get_badge_templates
    AcclaimApi.new.get_badge_templates
  end 
end
