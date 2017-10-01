class ContentsController < ApplicationController
  def edit
  	@paper = Paper.find(params[:paper_id])
  	@fields = Field.where("section_id = #{params[:section_id]}")
  	@contents = Content.where("paper_id = #{@paper.id} and field_id in (select distinct id from fields where section_id = #{params[:section_id]})")
  	if @contents.empty? 
  		@fields.each do |field|
  			c = Content.new
  			c.paper = @paper
  			c.field = field
  			c.save
  		end
  	#@contents = Content.where("paper_id = #{params[:paper_id]} and field_id in (select distinct section_id from fields where section_id = #{params[:section_id]})")
  	end
  	
  end

  def update
  	fields = params[:field_id]
  	#puts fields.inspect
  	papers = params[:paper_id]
  	#puts papers.inspect
  	contents = params[:content]
  	#puts contents.inspect
  	contents.zip(papers, fields) do |c, p, f|
  		content = Content.where("paper_id = #{p} and field_id = #{f}").first
  		content.update({:paper_id => p, :field_id => f, :content => c})
  	end
  end

end
