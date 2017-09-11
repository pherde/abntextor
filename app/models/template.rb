class Template < ApplicationRecord
	has_many :papers
	has_many :sections
end
