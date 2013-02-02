class Org < ActiveRecord::Base
  include NestedModel

  attr_accessible :name, :members_attributes

  validates_presence_of :name

  has_many :members, inverse_of: :org
  accepts_nested_attributes_for :members,
                                reject_if: -> attributes {all_nested_blank(attributes, %w(has_address))},
                                :allow_destroy => true

  def prepare_for_form
    members.build unless members.any?
    members.each do |member|
      member.build_address unless member.address
    end
  end
end
