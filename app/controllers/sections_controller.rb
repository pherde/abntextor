class SectionsController < ApplicationController
  authorize_resource
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :set_template, only: [:index, :new, :edit]
  before_action :set_count, only: [:new, :edit]

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.from_template(@template.id)
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
    @count = @count + 1
  end

  # GET /sections/1/edit
  def edit    
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to template_sections_path(@section.template), notice: 'Seção criada com sucesso.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to template_sections_path(@section.template), notice: 'Seção atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    if @section.destroy
      respond_to do |format|
        format.html { redirect_to template_sections_path(@section.template), notice: 'Seção excluída com sucesso.' }
        format.json { head :no_content }
      end
    else
      redirect_to template_sections_path(@section.template), alert: 'Seção não pode ser excluída: existem trabalhos que usam esse template.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :template_id, :is_editable, :is_wysiwyg, :position)
    end

    def set_template
      @template = Template.find(params[:template_id])
    end

    def set_count
      @count = @template.sections.count
    end

end
