# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	user = User.new({
		:name => "Alysson",
		:alias => "nu12",
		:is_active => true,
		:is_admin => true
		})

	template = Template.new({
		:name => "Blank",
		:description => true
		})

	section = Section.new({
		:name => "Content",
		:is_editable => true,
      	:is_wysiwyg => true
		})
	section.template = template

	field = Field.new({

		:name => "Content",
		:label => "Content",
		:open_tag => "\\documentclass{article}\\begin{document}",
		:close_tag => "\\end{document}"
		})
	field.section = section


	user.save
	template.save
	section.save
	field.save
