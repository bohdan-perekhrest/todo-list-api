FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "Project_#{n}" }
    user
  end
end