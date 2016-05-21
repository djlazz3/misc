require 'faker'
while(1 == 1)
input = gets.chomp.downcase
case input
when "name"
puts input + ": " + Faker::Name.name
when "email"
puts input + ": " + Faker::Internet.email
when "city"
puts input + ": " + Faker::Address.city
when "street name"
puts input + ": " + Faker::Address.street_name
when "street address"
puts input + ": " + Faker::Address.street_address
when "secondary address"
puts input + ": " + Faker::Address.secondary_address
when "building number"
puts input + ": " + Faker::Address.building_number
when "zip code"
puts input + ": " + Faker::Address.zip
when "post code"
puts input + ": " + Faker::Address.postcode
when "time zone"
puts input + ": " + Faker::Address.time_zone
when "state"
puts input + ": " + Faker::Address.state
when "country"
puts input + ": " + Faker::Address.country
when "latitude"
puts input + ": " + Faker::Address.latitude
when "longitude"
puts input + ": " + Faker::Address.longitude
when "bitcoin"
puts input + ": " + Faker::Bitcoin.address
when "credit card number"
puts input + ": " + Faker::Business.credit_card_number
when "credit card type"
puts input + ": " + Faker::Business.credit_card_type
when "color"
puts input + ": " + Faker::Commerce.color
when "department"
puts input + ": " + Faker::Commerce.department
when "product name"
puts input + ": " + Faker::Commerce.product_name
when "price"
puts input + ": " + Faker::Commerce.price.to_s
when "company name"
puts input + ": " + Faker::Company.name
when "logo"
puts input + ": " + Faker::Company.logo
when "user name"
puts input + ": " + Faker::Internet.user_name
when "password"
puts input + ": " + Faker::Internet.password
when "phone number"
puts input + ": " + Faker::PhoneNumber.phone_number
when "something smart"
puts input + ": " + Faker::Hacker.say_something_smart
when "abreviation"
puts input + ": " + Faker::Hacker.abbreviation
when "adjective"
puts input + ": " + Faker::Hacker.adjective
when "noun"
puts input + ": " + Faker::Hacker.noun
when "verb"
puts input + ": " + Faker::Hacker.verb
when "ingverb"
puts input + ": " + Faker::Hacker.ingverb
when "expiration date"
puts input + ": " + Faker::Business.credit_card_expiry_date.to_s
when "cls"
system("cls")
when "all"
puts "name: " + Faker::Name.name
puts "email: " + Faker::Internet.email
puts "city: " + Faker::Address.city
puts "street name: " + Faker::Address.street_name
puts "street address: " + Faker::Address.street_address
puts "secondary address: " + Faker::Address.secondary_address
puts "building number: " + Faker::Address.building_number
puts "zip code: " + Faker::Address.zip
puts "postcode: " + Faker::Address.postcode
puts "time zone: " + Faker::Address.time_zone
puts "state: " + Faker::Address.state
puts "country: " + Faker::Address.country
puts "latitude: " + Faker::Address.latitude
puts "longitude: " + Faker::Address.longitude
puts "bitcoin address: " + Faker::Bitcoin.address
puts "credit card number: " + Faker::Business.credit_card_number
puts "credit card expiration date: " + Faker::Business.credit_card_expiry_date.to_s
puts "credit card type: " + Faker::Business.credit_card_type
puts "color: " + Faker::Commerce.color
puts "department: " + Faker::Commerce.department
puts "product name: " + Faker::Commerce.product_name
puts "price: " + Faker::Commerce.price.to_s
puts "company name: " + Faker::Company.name
puts "company logo: " + Faker::Company.logo
puts "user name: " + Faker::Internet.user_name
puts "password: " + Faker::Internet.password
puts "phone number: " + Faker::PhoneNumber.phone_number
puts "something smart: " + Faker::Hacker.say_something_smart
puts "abbreviation: " + Faker::Hacker.abbreviation
puts "adjective: " + Faker::Hacker.adjective
puts "noun: " + Faker::Hacker.noun
puts "verb: " + Faker::Hacker.verb
puts "ingverb: " + Faker::Hacker.ingverb
else
puts "not a valid input"
end
end
