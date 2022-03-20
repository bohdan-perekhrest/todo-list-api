FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "someemail#{n}@gmail.com" }
    username { Faker::Name.name }
    password { 'password' }
  end
end