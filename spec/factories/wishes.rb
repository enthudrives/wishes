FactoryGirl.define do
  factory :wish do
    id 1
    content "Just a wish"
    user { build(:user) }
  end
end
