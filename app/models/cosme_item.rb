class CosmeItem < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  #  belongs_to_active_hash :cosme_category
   
   has_one_attached :image
   belongs_to :user, optional: true
   has_many :cosme_comments, dependent: :destroy
   has_many :bookmarks, dependent: :destroy
   
   def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
   end
end
