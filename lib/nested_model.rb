module NestedModel
  extend ActiveSupport::Concern

  module ClassMethods
    def all_nested_blank(attributes, ignored_attributes = [])
      attributes.all? do |key, value|
        if value.is_a? Hash
          all_nested_blank value, ignored_attributes
        else
          key == '_destroy' || ignored_attributes.include?(key) || value.blank?
        end
      end
    end
  end

  # Used to uniquely identify objects even if they don't have a persisted ID yet
  def form_id
    @form_id ||= @id || SecureRandom.uuid
  end

  protected
  # Used with #accepts_nested_attributes_for in the reject_if option to check if current model and all nested models
  # are actually blank
  # Using a pass-through instance method because being called as symbol uses instance method, being called from lambda
  # uses class method.
  def all_nested_blank(*parameters)
    self.class.all_nested_blank *parameters
  end
end
