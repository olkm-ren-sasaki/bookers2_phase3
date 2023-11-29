# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
USER_AMOUT = 5
BOOK_AMOUT = 20
GROUP_AMOUT = 10

USER_AMOUT.times do |n|
  User.create!(
    email: "sample#{n + 1}@sample",
    name: "sample#{n + 1}",
    password: "asdfasdf"
  )
end

BOOK_AMOUT.times do |n|
  user_id = User.pluck(:id).sample
  book_content = rand(100..999)
  Book.create!(
    user_id: user_id,
    title: "sample-#{user_id}-#{book_content}",
    body: "sample#{user_id}-#{book_content}",
    created_at: rand(Time.current.weeks_ago(1).beginning_of_week(start_day= :saturday)..Time.zone.now.end_of_day)
  )
end

(BOOK_AMOUT*2).times do |n|
  user_id = User.pluck(:id).sample
  book_id = Book.pluck(:id).sample
  unless Favorite.find_by(user_id: user_id, book_id: book_id)
    Favorite.create!(
      user_id: user_id,
      book_id: book_id
    )
  end
end

(USER_AMOUT*2).times do |n|
  follower_id = User.pluck(:id).sample
  followed_id = User.pluck(:id).sample
  if Relationship.find_by(follower_id: follower_id, followed_id: followed_id).nil? && follower_id != followed_id
    Relationship.create!(
      follower_id: follower_id,
      followed_id: followed_id
    )
  end
  
end
(USER_AMOUT).times do |n|
  owner_id = User.pluck(:id).sample
  introduction = ["楽しいよ", "面白いよ", "仲良いよ", "ワクワクするよ", "勉強しよう"].sample
  group = Group.create!(
    name: "sample#{owner_id}",
    introduction: introduction,
    owner_id: owner_id
  )
  GroupUser.create!(
    user_id: owner_id,
    group_id: group.id
  )
end

(USER_AMOUT*2).times do |n|
  group_id = Group.pluck(:id).sample
  user_id = User.pluck(:id).sample
  if GroupUser.find_by(group_id: group_id, user_id: user_id).nil?
    GroupUser.create!(
      group_id: group_id,
      user_id: user_id
    )
  end
end