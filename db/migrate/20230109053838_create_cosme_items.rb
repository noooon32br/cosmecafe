class CreateCosmeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cosme_items do |t|
      t.integer :cosme_category_id
      t.integer :user_id
      t.text :hashbody
      t.string :cosme_name
      t.text :description
      t.integer :views, null: false, default: 0
      t.string :keyword
      t.timestamps
    end
  end
end
