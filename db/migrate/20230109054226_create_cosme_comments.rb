class CreateCosmeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :cosme_comments do |t|
      t.integer :user_id
      t.integer :cosme_item_id
      t.text :comment
      t.timestamps
    end
  end
end
