class CreateCosmeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :cosme_categories do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
    
    add_index :cosme_categories, :name, unique: true
    add_index :cosme_categories, :ancestry
  end
end
