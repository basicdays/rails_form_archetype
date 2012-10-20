class Member < ActiveRecord::Base
  attr_accessible :name, :attendances
  validates_presence_of :name, :attendances

  belongs_to :org
  validates_presence_of :org
end
