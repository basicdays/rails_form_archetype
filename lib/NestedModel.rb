module NestedModel
  protected
  # Used with #accepts_nested_attributes_for in the reject_if option to check if current model and all nested models
  # are actually blank
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
