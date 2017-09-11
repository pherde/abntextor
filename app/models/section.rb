class Section < ApplicationRecord
  belongs_to :template
  has_many :fields
end
