class User < ActiveRecord::Base
  attr_accessible :name

  has_many :wishes
  has_many :recommendations
  has_many :votes

  validates :name, presence: true, uniqueness: true
end
