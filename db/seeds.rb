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
admin = Admin.find_or_initialize_by(:email => 'admin@web.jp')
admin.password = 'admin0101'
admin.save!

makeup = CosmeCategory.create(name: "メイクアップ")
makeup_1 = makeup.children.create([{name: "アイシャドウ"},{name: "口紅・グロス・リップライナー"},{name: "アイライナー"},{name: "マスカラ"}, {name: "アイブロウ"}, {name: "チーク"}])

basemake = CosmeCategory.create(name: "ベースメイク")
basemake_1 = basemake.children.create([{name: "ファンデーション"}, {name: "化粧下地・コンシーラー"}, {name: "フェイスパウダー"}])

haircare = CosmeCategory.create(name: "ヘアケア")
haircare_1 = haircare.children.create([{name: "シャンプー・トリートメント"},{name: "ヘアケア"},{name: "ヘアスタイリング"}])

skincare = CosmeCategory.create(name: "スキンケア・基礎化粧品")
skincare_1 = skincare.children.create([{name: "洗顔料"},{name: "クレンジング"},{name: "化粧水"}, {name: "乳液・美容液"}, {name: "パック・フェイスマスク"}, {name: "その他スキンケア"}])

sunscreen = CosmeCategory.create(name: "日焼け止め・UVケア")
sunscreen_1 = sunscreen.children.create([{name: "日焼け止め・UVケア(顔用)"}, {name: "日焼け止め・UVケア(ボディ用)"}])

bodycare = CosmeCategory.create(name: "ボディケア・オーラルケア")
bodycare_1 = bodycare.children.create([{name: "デイリーボディケア"}, {name: "その他ボディケア"}, {name: "オーラルケア"}])

goods = CosmeCategory.create(name: "美容グッズ")
goods_1 = goods.children.create([{name: "スキンケアグッズ"}, {name: "メイクアップグッズ"}, {name: "ボディグッズ"}, {name: "ヘアグッズ"}, {name: "その他グッズ"}])




