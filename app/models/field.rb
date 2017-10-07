class Field < ApplicationRecord
  belongs_to :section
  has_many :contents
  has_many :papers, through: :contents

  default_scope { order(position: :asc) }

  acts_as_list scope: :section

  def self.from_section section_id
  	where(section_id: section_id)
  end

  before_destroy { |f| throw :abort if f.section.template.papers.count > 0  }
end
