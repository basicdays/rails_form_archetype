class Address < ActiveRecord::Base
  attr_accessible :address1, :contact_id

  belongs_to :contact
  belongs_to :member

  validates :address1, presence: true
end
