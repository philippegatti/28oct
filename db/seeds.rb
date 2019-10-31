require 'database_cleaner' #permet de réinitialiser la base à chaque relance du seed

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

10.times do
	City.create(name:Faker::Address.city, zip_code:Faker::Address.zip_code)
end

puts "Cities created"

10.times do
	User.new(last_name:Faker::Name.last_name, first_name:Faker::Name.first_name, email: Faker::Internet.email, age:rand(12..100), description:Faker::Lorem.paragraph, city_id:City.all.sample.id, password: "motdepasse").save
end
puts "Users created"

20.times do
	Gossip.create(title:Faker::Movies::StarWars.quote, content:Faker::Lorem.paragraph, user_id:User.all.sample.id)
end
puts "Gossips created"


10.times do
	Tag.create(title:Faker::Book.genre)
end
puts "Tags created"


Gossip.all.each {|item| JoinGossipTag.create(gossip_id:item.id, tag_id:Tag.all.sample.id)}


20.times do
	Comment.create(content: Faker::Movies::Lebowski.quote, gossip_id:Gossip.all.sample.id, user_id: User.all.sample.id)
end
puts "Comments created"

while Like.all.size < 50
	begin
	Like.create(gossip_id:Gossip.all.sample.id, user_id: User.all.sample.id)
	rescue
	end
end
puts "Likes created"