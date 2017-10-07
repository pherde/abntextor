class Paper < ApplicationRecord
  require 'digest/sha1'
  belongs_to :template
  belongs_to :user

  has_many :contents
  has_many :fields, through: :contents, dependent: :destroy

  validates :hash_name, uniqueness: true

  def self.from_user user_id
  	where(user_id: user_id)
  end

  def self.from_hash_name hash_name
    where(hash_name: hash_name).first
  end

  before_validation(on: :create) do
  	self.hash_name = Digest::SHA1.hexdigest("#{user_id}-#{Time.now.to_i}-#{rand}")[1..8]
  end
end
