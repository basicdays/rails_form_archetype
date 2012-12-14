require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  test 'can assign params with blank nested models and be valid' do
    params = {
        name: "Conglomo",
        contact_attributes: {
            name: "",
            address_attributes: {address1: ""}
        }
    }
    business = Business.new params
    assert business.valid?
  end
end
