class Paper < ApplicationRecord
  require 'digest/sha1'
  belongs_to :template
  belongs_to :user

  has_many :contents
  has_many :fields, through: :contents, dependent: :destroy

  validates :hash_name, uniqueness: true

  before_validation(on: :create) do
  	self.hash_name = Digest::SHA1.hexdigest("#{user_id}-#{Time.now.to_i}-#{rand}")[1..8]
  end
end
