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