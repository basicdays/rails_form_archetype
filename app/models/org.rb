class Org < ActiveRecord::Base
  attr_accessible :name, :members_attributes

  validates_presence_of :name

  has_many :members, inverse_of: :org
  accepts_nested_attributes_for :members, reject_if: :all_blank, :allow_destroy => true
end
