require "active_attr"
require "set"

class Vote
  include ActiveAttr::MassAssignment
  attr_accessor :object, :voter, :value
end

class VoteSet < Set
  def add(new_vote)
    if existing_vote = find { |vote| vote.object == new_vote.object and vote.voter == new_vote.voter }
      if existing_vote.value != new_vote.value
        delete(existing_vote)
        super
      end
    else
      super
    end

    self
  end
  alias << add

  def delete_from_user(user)
    delete(find { |vote| vote.voter == user })
  end
end
