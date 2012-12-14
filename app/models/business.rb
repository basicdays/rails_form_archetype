class Business < ActiveRecord::Base
  include NestedModel

  attr_accessible :name, :contact_attributes

  has_one :contact
  accepts_nested_attributes_for :contact, reject_if: :all_nested_blank, :allow_destroy => true

  validates :name, presence: true

  def prepare_for_form
    build_contact unless contact
    contact.build_address unless contact.address
  end
end
