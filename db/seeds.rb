# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    email: "sample#{n + 1}@sample",
    name: "sample#{n + 1}",
    password: "sample#{n + 1}"
  )
  Book.create!(
    user_id: "#{n + 1}",
    title: "sample#{n + 1}",
    body: "sample#{n + 1}"
  )
end



# books = [
#   [1, "リーダブルコード", "より良いコードを書くためのシンプルで実践的なテクニック"],
#   [2, "トラブル知らずのシステム設計", "システム設計の要点を図解で説明してくれます"],
#   [3, "たのしいRuby", "Rubyの入門におすすめです"],
#   [4, "入門Git", "gitについての基本操作から内部構造まで解説してくれます"],
#   [5, "アルゴリズム図鑑", "アルゴリズムについてカラーイラストでしっかり解説してくれます"],
# ]

# books.each do |user_id, title, body|
#   Book.create!(
#     user_id: user_id,
#     title: title,
#     body: body
#   )
# end





