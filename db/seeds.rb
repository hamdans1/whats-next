50.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(7)
        )
end

users = User.all

25.times do
    Item.create!(
        user: users.sample,
        name: Faker::Seinfeld.quote
        )
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"