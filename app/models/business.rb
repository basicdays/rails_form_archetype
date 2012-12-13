class Business < ActiveRecord::Base
  attr_accessible :name, :contact_attributes

  has_one :contact
  accepts_nested_attributes_for :contact, reject_if: :all_nested_blank, :allow_destroy => true

  validates :name, presence: true

  protected
  def all_nested_blank(attributes)
    attributes.all? do |key, value|
      if value.is_a? Hash
        all_nested_blank value
      else
        key == '_destroy' || value.blank?
      end
    end
  end
end
