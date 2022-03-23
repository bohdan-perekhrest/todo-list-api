FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "Awesome_Body_#{n}" }
    task
    user
  end
end