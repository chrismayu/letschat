class AddIconsToDetails < ActiveRecord::Migration
  def change
    add_column :details, :social_link_1_icon, :string
    add_column :details, :social_link_1_url, :string
    add_column :details, :social_link_1_icon_id, :integer
    add_column :details, :social_link_2_icon, :string
    add_column :details, :social_link_2_url, :string
    add_column :details, :social_link_2_icon_id, :integer
    add_column :details, :social_link_3_icon, :string
    add_column :details, :social_link_3_url, :string
    add_column :details, :social_link_3_icon_id, :integer
    add_column :details, :social_link_4_icon, :string
    add_column :details, :social_link_4_url, :string
    add_column :details, :social_link_4_icon_id, :integer
    add_column :details, :social_link_5_icon, :string
    add_column :details, :social_link_5_url, :string
    add_column :details, :social_link_5_icon_id, :integer
    add_column :details, :social_link_6_icon, :string
    add_column :details, :social_link_6_url, :string
    add_column :details, :social_link_6_icon_id, :integer
    add_column :details, :social_link_7_icon, :string
    add_column :details, :social_link_7_url, :string
    add_column :details, :social_link_7_icon_id, :integer
    add_column :details, :social_link_8_icon, :string
    add_column :details, :social_link_8_url, :string
    add_column :details, :social_link_8_icon_id, :integer
    add_column :details, :social_link_9_icon, :string
    add_column :details, :social_link_9_url, :string
    add_column :details, :social_link_9_icon_id, :integer
    add_column :details, :social_link_10_icon, :string
    add_column :details, :social_link_10_url, :string
    add_column :details, :social_link_10_icon_id, :integer
  end
end
