class CreateCosmeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :cosme_categories do |t|
      t.string :name
      t.string :ancestry, index: true
      t.timestamps
    end
  end
end
