# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# admin = Admin.new(
#   email: 'admin@web.jp',
#   password: 'admin0123'
#  )
# admin.save!
Admin.find_or_create_by!(email: 'admin@web.jp') do |admin|
  admin.password = 'admin0101'
end

makeup = CosmeCategory.find_or_create_by!(name: "メイクアップ")
makeup_child_names = [
  "アイシャドウ",
  "口紅・グロス・リップライナー",
  "アイライナー",
  "マスカラ",
  "アイブロウ",
  "チーク"
]
makeup_child_names.each do |name|
  makeup.children.find_or_create_by!(name: name)
end

basemake = CosmeCategory.find_or_create_by!(name: "ベースメイク")
basemake_child_names = [
  "ファンデーション",
  "化粧下地・コンシーラー",
  "フェイスパウダー"
]
basemake_child_names.each do |name|
  basemake.children.find_or_create_by!(name: name)
end

#haircare = CosmeCategory.create(name: "ヘアケア・スタイリング")
#haircare_1 = haircare.children.create([{name: "シャンプー・トリートメント"},{name: "ヘアケア"},{name: "ヘアスタイリング"}])

#skincare = CosmeCategory.create(name: "スキンケア・基礎化粧品")
#skincare_1 = skincare.children.create([{name: "洗顔料"},{name: "クレンジング"},{name: "化粧水"}, {name: "乳液・美容液"}, {name: "パック・フェイスマスク"}, {name: "その他スキンケア"}])

#sunscreen = CosmeCategory.create(name: "日焼け止め・UVケア")
#sunscreen_1 = sunscreen.children.create([{name: "日焼け止め・UVケア(顔用)"}, {name: "日焼け止め・UVケア(ボディ用)"}])

#bodycare = CosmeCategory.create(name: "ボディケア・オーラルケア")
#bodycare_1 = bodycare.children.create([{name: "デイリーボディケア"}, {name: "その他ボディケア"}, {name: "オーラルケア"}])

#goods = CosmeCategory.create(name: "美容グッズ")
#goods_1 = goods.children.create([{name: "スキンケアグッズ"}, {name: "メイクアップグッズ"}, {name: "ボディグッズ"}, {name: "ヘアグッズ"}, {name: "その他グッズ"}])

p "seedデータ作成しました"