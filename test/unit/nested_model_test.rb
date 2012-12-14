require 'test_helper'

class NestedModelTest < ActiveSupport::TestCase
  include NestedModel

  test 'properly checks if all nested models are blank' do
    params = {
        name: '',
        address_attributes: {
            address1: ''
        }
    }
    assert all_nested_blank(params)
  end

  test 'properly checks if all nested models aren\'t blank' do
    params = {
        name: '',
        address_attributes: {
            address1: 'boo'
        }
    }
    assert !all_nested_blank(params)
  end
end
