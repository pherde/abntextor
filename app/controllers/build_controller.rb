class BuildController < ApplicationController
  def build
    @tex = ""
    @paper = Paper.from_hash_name(params[:hash_name])
    @paper.template.sections.each do |section|
      section.fields.each do |field|
        content = Content.where("paper_id = #{@paper.id} and field_id = #{field.id}").first

        content ||= Content.new
        content.content ||= ""
        
        if field.section.is_wysiwyg
          @tex = "#{@tex} #{field.open_tag} #{Html2latex.traduzir(content.content)} #{field.close_tag} "
        elsif field.is_multivalue
          @tex = "#{@tex} #{field.open_tag} #{content.content.index(',') == nil ?  content.content : content.content.gsub!(/,/, ' \\and ')} #{field.close_tag} "
        elsif field.section.is_editable
          @tex = "#{@tex} #{field.open_tag} #{content.content} #{field.close_tag} "
        else
          @tex = "#{@tex} #{field.open_tag}#{field.close_tag} "
        end
      end
    end
    arquivo = "public/pdf/#{@paper.hash_name}.tex"
    File.open(arquivo, "w") do |f|
      f.write(@tex)
    end
    system("pdflatex --interaction=nonstopmode -output-directory=public/pdf --shell-escape #{arquivo}")
     @paper.touch
     if File.exists? "public/pdf/#{@paper.hash_name}.pdf"
      redirect_to "/pdf/#{@paper.hash_name}.pdf"
    else
      redirect_to root_path, alert: 'Não foi possível gerar o PDF desse trabalho.'
    end
     authorize!(:build, @paper)
  end
end
