class Field < ApplicationRecord
  belongs_to :section
  has_many :contents
  has_many :papers, through: :contents

  default_scope { order(position: :asc) }

  acts_as_list scope: :section

  validates :name, presence: { message: "Nome do campo é obrigatório" }
  validates :label, presence: { message: "Label para o campo é obrigatório" }
  validates :open_tag, presence: { message: "Tag de abertura para o campo é obrigatória" }
  validates :close_tag, presence: { message: "Tag de fechamento para o campo é obrigatória" }

  validates :name, uniqueness: {scope: :section_id, message: "Já existe um campo com esse nome para essa seção" }
  validates :label, uniqueness: {scope: :section_id, message: "Já existe um campo com esse label para essa seção" }
  validates :open_tag, uniqueness: {scope: :section_id, message: "Já existe um campo com essa tag de abertura para essa seção" }

  validates :section_id, presence: { message: "Não foi possível identificar a seção do campo" }
  validates :position, presence: { message: "Não foi possível identificar a posição do campo" }

  def self.from_section section_id
  	where(section_id: section_id)
  end

  before_destroy { |f| throw :abort if f.section.template.papers.count > 0  }
end
