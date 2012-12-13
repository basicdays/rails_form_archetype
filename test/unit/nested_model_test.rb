class NestedModelTest < ActiveSupport::TestCase
  #include NestedModel
  #class StubObject
  #
  #  def test_blank(attributes)
  #    all_nested_blank attributes
  #  end
  #end

  test 'properly checks if all nested models are blank' do
    params = {
        name: '',
        address_attributes: {
            address1: ''
        }
    }
    #obj = StubObject.new

    assert all_nested_blank(params)
  end
end
