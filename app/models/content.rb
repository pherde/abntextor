class Content < ApplicationRecord
  belongs_to :paper
  belongs_to :field

  def user_id
  	self.paper.user_id
  end
end
