require 'database_cleaner' #permet de réinitialiser la base à chaque relance du seed

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

10.times do
	City.create(name:Faker::Address.city, zip_code:Faker::Address.zip_code)
end

puts "Cities created"

10.times do
	User.create(last_name:Faker::Name.last_name, first_name:Faker::Name.first_name, email: Faker::Internet.email, age:rand(12..100), description:Faker::Lorem.paragraph, city_id:City.all.sample.id)
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
	PrivateMessage.create(content: Faker::Movies::StarWars.quote, user_id: User.all.sample.id)
end
puts "Private Messages created"
25.times do
	JoinPmRecipient.create(private_message_id: PrivateMessage.all.sample.id, user_id: User.all.sample.id)
end


20.times do
	Comment.create(content: Faker::Movies::Lebowski.quote, gossip_id:Gossip.all.sample.id, user_id: User.all.sample.id)
end
puts "Comments created"
#JoinPmRecipient.where(user_id: User.find_by(first_name: "Juanita").id).map{|item| PrivateMessage.find(item.private_message_id)} -> si tu veux connaitre les privates_messages reçus par Juanita...