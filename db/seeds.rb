# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	user = User.new({
		"name":"Admin",
		"alias":"admin",
		"is_active":true,
		"is_admin":true,
		"email":"admin@admin.com",
		"password":'admin',
		"password_confirmation":'admin'
		})

	

	template1 = Template.new({
		"name":"Em branco",
		"description":"Template básico, sem elementos de título",
		"is_active":true
		})

	template2 = Template.new({
		"name":"Básico",
		"description":"Template básico, com título e autor",
		"is_active":true
		})

	section1 = Section.new({
		"name":"Conteúdo",
		"is_editable":true,
		"is_wysiwyg":true,
		"position":1
		})

	section2 = Section.new({
		"name":"Cabeçalho",
		"is_editable":true,
		"is_wysiwyg":false,
		"position":1
		})

	section3 = Section.new({
		"name":"Conteúdo",
		"is_editable":true,
		"is_wysiwyg":true,
		"position":2
		})

	section1.template = template1
	section2.template = template2
	section3.template = template2

	field1 = Field.new({
		:name => "Conteúdo",
		:label => "Conteúdo",
		:open_tag => "\\documentclass{article}\\begin{document}",
		:close_tag => "\\end{document}",
		:position => "1"
		})

	field2 = Field.new({
		:name => "Título",
		:label => "Título",
		:open_tag => "\\documentclass{article} \\usepackage[utf8]{inputenc} \\title{",
		:close_tag => "}",
		:position => "1"
		})
	field3 = Field.new({
		:name => "Autor",
		:label => "Autores",
		:open_tag => "\\author{",
		:close_tag => "}",
		:position => "2",
		:is_multivalue => true
	 	})

	field4 = Field.new({
		:name => "Conteúdo",
		:label => "Conteúdo",
		:open_tag => "\\documentclass{article}\\begin{document}\\maketitle",
		:close_tag => "\\end{document}",
		:position => "1"
		})

	field1.section = section1
	field2.section = section2
	field3.section = section2
	field4.section = section3
	

	user.save(:validate => false)
	template1.save
	section1.save
	section2.save
	section3.save
	field1.save
	field2.save
	field3.save
	field4.save
