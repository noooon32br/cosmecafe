class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :cosme_item
end
