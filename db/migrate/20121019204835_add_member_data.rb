class AddMemberData < ActiveRecord::Migration
  def change
    add_column :members, :attendances, :integer
  end
end
