class Member < ActiveRecord::Base
  include NestedModel

  attr_accessible :name, :attendances, :has_address, :address_attributes
  validates_presence_of :name, :attendances

  belongs_to :org

  has_one :address
  accepts_nested_attributes_for :address, reject_if: :all_blank

  validates :org, presence: true
  validate :check_address

  protected
  def check_address
    if has_address? and !address
      errors.add(:has_address, 'Need to fill out an address')
    end
  end
end
