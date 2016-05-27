class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_reference :users, :client, polymorphic: true, index: true
  end
end
