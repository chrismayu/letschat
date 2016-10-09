class AddSlugToDetails < ActiveRecord::Migration
  def change
    add_column :details, :slug, :string
    add_column :details, :name, :string
  end
end
