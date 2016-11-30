class AddTopToIcon < ActiveRecord::Migration
  def change
    add_column :icons,:top_icons, :boolean,  default: false
  end
end
