class Section < ApplicationRecord
  belongs_to :template
  has_many :fields
  default_scope { order(position: :asc) }

  acts_as_list scope: :template

  def self.from_template template_id
  	where(template_id: template_id)
  end

  before_destroy { |s| throw :abort if s.template.papers.count > 0  }

end
