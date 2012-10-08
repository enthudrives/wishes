class User < ActiveRecord::Base
  # name, email, uid, provider

  has_many :wishes
  has_many :recommendations
  has_many :votes

  def self.from_omniauth(auth)
    where("uid = ?", auth["uid"]) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
    end
  end
end
