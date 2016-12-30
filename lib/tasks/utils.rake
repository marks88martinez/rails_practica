namespace :utils do
  desc "Popular banco de datos"
  task seed: :environment do
  puts "generando los contactos (CONTACTOS)"
    100.times do |i|
      Contact.create!(
      name: Faker::Name.name,
      email:Faker::Internet.email,
      kind: Kind.all.sample,
      rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)

      )
    end
  puts "generando los contactos (CONTACTOS)...OK"

  puts "generando los direccion (ADDRESSES)"
    Contact.all.each do |cont|
      Address.create!(
      street: Faker::Address.street_address,
      city:Faker::Address.city,
      state:Faker::Address.state_abbr,
      contact: cont

      )
    end
  puts "generando los direccion (ADDRESSES)...OK"

  puts "generando los telefonos (phones)"
  Contact.all.each do |conta|
      Random.rand(1..5).times do |i|
        Phone.create!(
        phone:Faker::PhoneNumber.phone_number,
        contact:conta
        )
      end
  end

  puts "generando los telefonos (phones)...OK"

  end

end
