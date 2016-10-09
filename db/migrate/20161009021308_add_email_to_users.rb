class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :yes_receive_email, :boolean, default: false
    add_column :users, :display_name, :string, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
