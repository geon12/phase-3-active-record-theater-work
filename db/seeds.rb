puts "Clearing and seeding data"

Audition.destroy_all
Role.destroy_all

r1 = Role.create(character_name: "Rey")
r2 = Role.create(character_name: "Vader")
r3 = Role.create(character_name: "Maximus")
r4 = Role.create(character_name: "Frodo")

role_ids = Role.all.map {|role| role.id}

20.times do
    Audition.create(actor: Faker::Name.name , location:Faker::Address.city , phone: rand(0..100000000) , hired: [true,false].sample, role_id:role_ids.sample)
end

puts "Done"

