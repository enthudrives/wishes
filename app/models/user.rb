class User < ActiveRecord::Base
  # name, email, uid, provider

  MAX_NO_OF_WISHES = 3

  has_many :wishes
  has_many :recommendations, dependent: :destroy
  has_many :votes, dependent: :destroy

  def self.from_omniauth(auth)
    find_by_uid(auth["uid"].to_s) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
    end
  end

  def wishes_left
    MAX_NO_OF_WISHES - wishes.count
  end

  def has_wishes_left?
    wishes_left > 0
  end

  def has_voted_for?(wish)
    votes.exists?(wish_id: wish.id)
  end
end
