class Paper < ApplicationRecord
  require 'digest/sha1'
  belongs_to :template
  belongs_to :user

  default_scope { order(updated_at: :desc) }

  has_many :contents
  has_many :fields, through: :contents, dependent: :destroy

  validates :name, presence: { message: "Nome do trabalho é obrigatório" }
  validates :name, uniqueness: {scope: :user_id, message: "Já existe um trabalho com esse nome" } # User scope
  validates :user_id, presence: { message: "Não foi possível identificar o usuário logado" }
  validates :template_id, presence: { message: "Não foi possível identificar o template escolhido" }
  validates :hash_name, uniqueness: { message: "Erro ao gerar nome público" }

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
