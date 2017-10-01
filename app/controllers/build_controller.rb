class BuildController < ApplicationController
  def build
    @tex = ""
    @paper = Paper.find(params[:id])
    @paper.template.sections.each do |section|
      section.fields.each do |field|
        content = Content.where("paper_id = #{@paper.id} and field_id = #{field.id}").first
        @tex = "#{@tex} #{field.open_tag} #{Html2latex.traduzir(content.content)} #{field.close_tag} "
        arquivo = "public/tex/#{@paper.id}.tex"
        File.open(arquivo, "w") do |f|
          f.write(@tex)
        end
        system("pdflatex --interaction=nonstopmode -output-directory=public/tex #{arquivo}")
      end
    end
    

  end
end
