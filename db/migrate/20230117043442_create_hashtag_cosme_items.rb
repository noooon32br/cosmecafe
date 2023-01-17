class CreateHashtagCosmeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtag_cosme_items do |t|
      t.references :cosme_item, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
