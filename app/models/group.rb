class Group < ActiveRecord::Base
  has_many :contact_group
  has_many :products, through: :contact_group
end
