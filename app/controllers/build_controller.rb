class BuildController < ApplicationController
  def build
    @tex = ""
    @paper = Paper.from_hash_name(params[:hash_name])
    @paper.template.sections.each do |section|
      section.fields.each do |field|
        content = Content.where("paper_id = #{@paper.id} and field_id = #{field.id}").first
        
        if field.section.is_wysiwyg
          @tex = "#{@tex} #{field.open_tag} #{Html2latex.traduzir(content.content)} #{field.close_tag} "
        elsif field.is_multivalue
          @tex = "#{@tex} #{field.open_tag} #{content.content.index(',') == nil ?  content.content : content.content.gsub!(/,/, ' \\and ')} #{field.close_tag} "
        elsif field.section.is_editable
          @tex = "#{@tex} #{field.open_tag} #{content.content} #{field.close_tag} "
        else
          @tex = "#{@tex} #{field.open_tag} #{field.close_tag} "
        end
      end
    end
    arquivo = "public/tex/#{@paper.id}.tex"
    File.open(arquivo, "w") do |f|
      f.write(@tex)
    end
    system("pdflatex --interaction=nonstopmode -output-directory=public/tex #{arquivo}")
     @paper.touch # Update paper
     authorize!(:build, @paper)
  end
end
