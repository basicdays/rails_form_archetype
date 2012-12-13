class Contact < ActiveRecord::Base
  attr_accessible :business_id, :name, :address_attributes

  has_one :address
  accepts_nested_attributes_for :address, reject_if: :all_blank

  belongs_to :business

  validates :name, presence: true
end
