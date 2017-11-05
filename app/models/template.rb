class Template < ApplicationRecord
	has_many :papers
	has_many :sections, dependent: :destroy
	default_scope { order(position: :asc) }

	validates :name, presence: { message: "Nome do template é obrigatório" }
	validates :name, uniqueness: { message: "Já existe um template com o nome escolhido" }
	validates :description, presence: { message: "Descrição do template é obrigatória" }
	validates :position, presence: { message: "Não foi possível identificar a posição do template" }

    acts_as_list
	def self.active
		where("is_active", true)
	end

	before_destroy { |t| throw :abort if t.papers.count > 0  }

	def initial_section
		s = sections[0]
		self.sections.each do |section|
			if section.is_editable 
				s = section
				break
			end
		end
		return s
	end
end
