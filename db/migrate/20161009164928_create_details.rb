class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :user_id
      t.boolean :email_able,       default: false
      t.string :details_email
      t.string :cellphone
      t.string :phone2
      t.integer :country_id
      t.integer :state_id
      t.string :city
      t.string :address
      t.string :province
      t.string :country
      t.string :social_link_1
      t.string :social_link_2
      t.string :social_link_3
      t.string :social_link_4
      t.string :social_link_5
      t.string :social_link_6
      t.string :social_link_7
      t.string :social_link_8
      t.string :social_link_9
      t.string :social_link_10

      t.timestamps null: false
    end
  end
end
