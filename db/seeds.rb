# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Chat.destroy_all
Message.destroy_all
Friendship.destroy_all


10.times { User.create({username:Faker::Name.middle_name, password: '123'})}

5.times { User.create({username:Faker::Name.middle_name, password: '123', logged_in: true})}

User.all.each do |user|
  5.times {Friendship.create({user1: user.id, user2: User.all.sample.id})}
end

Friendship.all.each do |f|
  newChat = Chat.create({friendship_id: f.id})
  UserConversation.create({chat_id: newChat.id, user_id: f.user1})
  UserConversation.create({chat_id: newChat.id, user_id: f.user2})
end

Chat.all.each do |chat|
  User.all.each do |user|
    1+rand(10).times do
      Message.create({user_id: user.id, chat_id: chat.id, content: Faker::Movie.quote})
    end
  end
end
