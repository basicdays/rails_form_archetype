class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :org_id

      t.timestamps
    end
    add_index :members, :org_id
  end
end
