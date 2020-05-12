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



10.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

# Creation de 10 tags
10.times do
  tag = Tag.create(title: Faker::Job.field)
end


  
  # Creation de 10 utilisateurs
  10.times do
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email,age: rand(18..60), description: Faker::Hipster.paragraph(sentence_count: 1), city_id:City.ids.sample,password:"123456789")
  end

  # Creation de 20 potins
  20.times do

     gossip = Gossip.create(title: Faker::Book.title,content: Faker::Hipster.paragraph(sentence_count: 10), user_id: User.ids.sample)
      
      # Mise à jour des tag_id de tout les gossips
      gossip.tags << Tag.all.sample
      
      # Mise à jour des gossip_id de tout les tags
      Tag.all.each do |tag|
        tag.gossips << gossip
      end
  end

10.times do
  comment = Comment.create(user_id: User.ids.sample , 
    gossip_id: Gossip.ids.sample , 
    content: Faker::Hipster.paragraph(sentence_count: 3) )
end

