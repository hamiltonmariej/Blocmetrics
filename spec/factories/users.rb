FactoryGirl.define do
  factory :user do
    name "Test User"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    role "standard"
  end

  factory :user_with_registered_application do
    after(:build) do |user|
      user.registered_application << build(:registered_application)
    end
  end

  factory :admin_user, class: User do
    name "Admin User"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role "admin"
  end
end
