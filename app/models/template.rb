class Template < ApplicationRecord
	has_many :papers
	has_many :sections, dependent: :destroy
	default_scope { order(position: :asc) }

    acts_as_list
	def self.active
		where("is_active", true)
	end

	before_destroy { |t| throw :abort if t.papers.count > 0  }

end
