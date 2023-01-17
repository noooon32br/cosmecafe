class HashtagCosmeItem < ApplicationRecord
  belongs_to :cosme_item
  belongs_to :hashtag
  validates :cosme_item_id, presence: true
  validates :hashtag_id, presence: true
end
