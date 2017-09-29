FactoryGirl.define do
  factory :pathfinder_class do
    sequence(:name) { PathfinderClass::CLASSES.sample }
  end
end
