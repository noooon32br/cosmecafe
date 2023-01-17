class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 50 }
  has_many :hashtag_cosme_items, dependent: :destroy
  has_many :cosme_items, through: :hashtag_cosme_items
end
