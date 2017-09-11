class Paper < ApplicationRecord
  belongs_to :template
  belongs_to :user

  has_many :contents
  has_many :fields, through: :contents
end
