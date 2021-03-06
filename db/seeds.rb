# Create Users
10.times do
  require 'faker'
  standard = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    )
    standard.skip_confirmation!
    standard.save!
end

# Create Registered Applications
25.times do
  require 'faker'
  registered_application = RegisteredApplication.create(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: User.all.sample
    )
end

# Create Events
75.times do
  require 'faker'
  event = Event.create(
    name: Faker::Lorem.word,
    registered_application: RegisteredApplication.all.sample
    )
end

admin = User.create!(
    name: 'Jeannine Hamilton',
    email:      'jeannine.hamilton@gmail.com',
    password:   'password',
    role:       'admin'
)
admin.skip_confirmation!
admin.save!

standard = User.create!(
    name: 'Jane Brown',
    email:      'jbrown@email.com',
    password:   'helloworld',
)
standard.skip_confirmation!
standard.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
