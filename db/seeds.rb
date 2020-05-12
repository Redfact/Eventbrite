# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Creation de 10 villes

require 'faker'

User.all.destroy_all
Event.all.destroy_all
Participation.all.destroy_all

  5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(first_name:first_name,last_name:last_name,email:"#{first_name}-#{last_name}@yopmail.com",password:"123456789",description: Faker::Hipster.paragraph(sentence_count: 3) )
  end


10.times do
Event.create(start_date:Faker::Date.between(from: Date.today, to: ("2020-12-31")),
        duration: rand(1..120),
        title:Faker::Book.title,
        description:Faker::Hipster.paragraph(sentence_count: 10),
        price: rand(1..100),
        location:Faker::Address.city,
        admin_id: User.ids.sample )
end

10.times do
  Participation.create(user_id: User.ids.sample , event_id: Event.ids.sample )
end

