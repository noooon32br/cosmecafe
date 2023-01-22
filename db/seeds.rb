# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
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

haircare = CosmeCategory.find_or_create_by!(name: "ヘアケア・スタイリング")
haircare_child_names = [
  "シャンプー・トリートメント",
  "ヘアケア",
  "ヘアスタイリング"
]
haircare_child_names.each do |name|
  haircare.children.find_or_create_by!(name: name)
end

skincare = CosmeCategory.find_or_create_by!(name: "スキンケア・基礎化粧品")
skincare_child_names = [
  "洗顔料",
  "クレンジング",
  "化粧水",
  "乳液・美容液",
  "パック・フェイスマスク",
  "その他スキンケア"
]
skincare_child_names.each do |name|
  skincare.children.find_or_create_by!(name: name)
end

sunscreen = CosmeCategory.find_or_create_by!(name: "日焼け止め・UVケア")
sunscreen_child_names = [
  "日焼け止め・UVケア(顔用)",
  "日焼け止め・UVケア(ボディ用)"
]
sunscreen_child_names.each do |name|
  sunscreen.children.find_or_create_by!(name: name)
end

bodycare = CosmeCategory.find_or_create_by!(name: "ボディケア・オーラルケア")
bodycare_child_names = [
  "デイリーボディケア",
  "その他ボディケア",
  "オーラルケア"
]
bodycare_child_names.each do |name|
  bodycare.children.find_or_create_by!(name: name)
end

goods = CosmeCategory.find_or_create_by!(name: "美容グッズ")
goods_child_names = [
  "スキンケアグッズ",
  "メイクアップグッズ",
  "ボディグッズ",
  "ヘアグッズ",
  "その他グッズ"
]
goods_child_names.each do |name|
  goods.children.find_or_create_by!(name: name)
end

p "seedデータ作成しました"