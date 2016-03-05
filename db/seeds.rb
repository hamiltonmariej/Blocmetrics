require 'faker'

# Create Users
10.times do
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
  registered_application = RegisteredApplication.create(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: User.all.sample
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
