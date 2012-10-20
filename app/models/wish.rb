class Wish < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :recommendations, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :content, presence:   { message: "I'm sorry but did I miss your wish?" },
                      uniqueness: { message: "Someone else already made that same wish" },
                      length:     { in: 10..140 }

  scope :latest, order("created_at DESC").limit(10)
  scope :popular, order("rank DESC").limit(10)

  def author_name
    user.name
  end

  private

  before_validation do |wish|
    errors[:base] << "Looks like you spent all your 3 wishes" unless user.has_wishes_left?
  end

  before_create do |wish|
    wish.rank = 0
  end
end
