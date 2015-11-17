class Contact < ActiveRecord::Base

  def friendly_created_at
    return created_at.strftime("%A, %d %b %Y %l:%M %p %Z")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
