class Wish < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :recommendations
  has_many :votes

  validates :content, presence:   { message: "I'm sorry but did I miss your wish?" },
                      uniqueness: { message: "Someone else already made that same wish" },
                      length:     { in: 10..140 }

  def rank
    votes.count
  end

  def author_name
    user.name
  end

  private

  before_validation do |wish|
    errors[:base] << "Looks like you spent all your 3 wishes" unless user.has_wishes_left?
  end
end
