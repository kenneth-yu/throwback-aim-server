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

20.times { User.create({username:Faker::Name.middle_name, password_digest: 'password'})}

20.times{
Chat.create() }

User.all.each do |user|
  Chat.all.each do |chat|
    1+rand(10).times do
      Message.create({user_id: user.id, chat_id: chat.id, content: Faker::Movie.quote})
    end
  end
end
