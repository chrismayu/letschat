class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.integer :user_id
      t.integer :detail_id
      t.string :icon_css
      t.string :name

      t.timestamps null: false
    end
  end
end
