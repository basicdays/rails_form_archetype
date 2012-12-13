class Address < ActiveRecord::Base
  attr_accessible :address1, :contact_id

  belongs_to :contact

  validates :address1, presence: true
end
