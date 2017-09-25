FactoryGirl.define do
  factory :pathfinder_class do
    sequence(:name) { |n| "Pathfinder Class name 0#{n}" }
  end
end
