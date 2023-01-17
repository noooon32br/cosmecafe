class CosmeCategory < ApplicationRecord
  has_many :cosme_items
  has_ancestry
end
