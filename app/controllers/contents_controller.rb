class ContentsController < ApplicationController
  authorize_resource
  def edit
    @wide_layout = true
  	@paper = Paper.from_hash_name(params[:hash_name])
  	@fields = Field.where("section_id = #{params[:section_id]}")
  	@contents = Content.where("paper_id = #{@paper.id} and field_id in (select distinct id from fields where section_id = #{params[:section_id]})")
  	if @contents.empty? 
  		@fields.each do |field|
  			c = Content.new
  			c.paper = @paper
  			c.field = field
  			c.save
  		end
  	end
  	
  end

  def update
  	fields = params[:field_id]
  	papers = params[:paper_id]
  	contents = params[:content]
  	contents.zip(papers, fields) do |c, p, f|
  		content = Content.where("paper_id = #{p} and field_id = #{f}").first
  		content.update({:paper_id => p, :field_id => f, :content => c})
      
      content.paper.touch # Update paper
  	end
  end
end
