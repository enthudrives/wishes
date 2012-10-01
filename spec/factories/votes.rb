FactoryGirl.define do
  factory :vote do
    wish { build(:wish) }
    user { build(:user) }
  end
end
