require 'gems'

class Recommendation < ActiveRecord::Base
  attr_accessible :gem, :wish_id

  belongs_to :wish
  belongs_to :user

  validates_presence_of :gem
  validate :rubygem

  private

  def rubygem
    errors.add(:gem, 'is not a valid Rubygem') unless Gems.info(gem)
  end
end