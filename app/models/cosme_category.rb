class CosmeCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '化粧水' },
    { id: 3, name: '乳液' },
    { id: 4, name: 'オールインワン' },
    { id: 5, name: 'クレンジング' },
    { id: 6, name: '洗顔料' },
    { id: 7, name: '日焼け止め' },
    { id: 8, name: 'リップ' },
    { id: 9, name: '香水' },
    { id: 10, name: 'ヘアカラー' },
    { id: 11, name: 'ヘアスタイリング' },
    { id: 12, name: 'シャンプー・コンディショナー' },
    { id: 13, name: 'コンタクトレンズ' }
  ]
    
  include ActiveHash::Associations
  has_many :cosme_items
end
