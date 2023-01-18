class CosmeItem < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  #  belongs_to_active_hash :cosme_category
   
   has_one_attached :image
   belongs_to :user, optional: true
   has_many :cosme_comments, dependent: :destroy
   has_many :bookmarks, dependent: :destroy
   has_many :hashtag_cosme_items, dependent: :destroy
   has_many :hashtags, through: :hashtag_cosme_items
   belongs_to :cosme_category, optional: true
   
   def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
   end
   
    # 検索方法分岐
  def self.looks(word)
    if word.present?
      @cosmeitem = CosmeItem.where("cosme_name LIKE?","%#{word}%")
    else
      @cosmeitem = CosmeItem.all
    end
  end
  
  after_create do
    cosme_item = CosmeItem.find_by(id: id)
    # hashbodyに打ち込まれたハッシュタグを検出
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      # ハッシュタグは先頭の#を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      cosme_item.hashtags << tag
    end
  end
  
   #更新アクション
  before_update do
    cosme_item = CosmeItem.find_by(id: id)
    cosme_item.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #Hashtagが既に存在しているかを調べ、なければ作成
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      cosme_item.hashtags << tag
    end
  end
end
