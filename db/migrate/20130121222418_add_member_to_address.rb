class AddMemberToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :member_id, :integer
  end
end
