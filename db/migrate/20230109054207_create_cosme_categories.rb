class CreateCosmeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :cosme_categories do |t|
      t.string :category_name
      t.timestamps
    end
  end
end
