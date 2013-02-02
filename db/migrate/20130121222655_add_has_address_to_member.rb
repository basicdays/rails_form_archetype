class AddHasAddressToMember < ActiveRecord::Migration
  def change
    add_column :members, :has_address, :boolean
  end
end
