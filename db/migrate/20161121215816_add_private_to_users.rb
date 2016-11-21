class AddPrivateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :keep_private, :boolean, default: false
  end
end
