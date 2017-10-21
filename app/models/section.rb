class Section < ApplicationRecord
  belongs_to :template
  has_many :fields, dependent: :destroy
  default_scope { order(position: :asc) }

  acts_as_list scope: :template

  validates :name, presence: { message: "Nome da seção é obrigatório" }
  validates :name, uniqueness: {scope: :template_id, message: "Já existe uma seção com esse nome para esse template" }
  validates :template_id, presence: { message: "Não foi possível identificar o template da seção" }
  validates :position, presence: { message: "Não foi possível identificar a posição da seção" }

  def self.from_template template_id
  	where(template_id: template_id)
  end

  before_destroy { |s| throw :abort if s.template.papers.count > 0  }

end
