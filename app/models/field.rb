class Field < ApplicationRecord
  belongs_to :section
  has_many :contents
  has_many :papers, through: :contents
end
