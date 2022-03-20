FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task_#{n}" }
    sequence(:position) { |n| n }
    done { false }
    project
    user
  end
end