FactoryGirl.define do
  factory :recommendation do
    gem 'rails'
    wish { build(:wish) }
    user { build(:user) }
  end
end
