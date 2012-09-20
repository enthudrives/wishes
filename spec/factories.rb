FactoryGirl.define do
  factory :rubygem do
    name "rails"
  end

  factory :user do
    name "Matz"
  end

  factory :wish do
    content "Just a wish."
  end
end
