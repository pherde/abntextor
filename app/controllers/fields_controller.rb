class FieldsController < ApplicationController
  authorize_resource
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  before_action :set_section, only: [:index, :new, :edit]
  before_action :set_count, only: [:new, :edit]

  # GET /fields
  # GET /fields.json
  def index
    @fields = Field.from_section(@section.id).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /fields/1
  # GET /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
    @count = @count + 1
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields
  # POST /fields.json
  def create
    @field = Field.new(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to session.delete(:referer), notice: 'Campo criado com sucesso.' }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1
  # PATCH/PUT /fields/1.json
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to session.delete(:referer), notice: 'Campo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1
  # DELETE /fields/1.json
  def destroy
    if @field.destroy
      respond_to do |format|
        format.html { redirect_to section_fields_path(@field.section), notice: 'Campo excluído com sucesso.' }
        format.json { head :no_content }
      end
    else
      redirect_to section_fields_path(@field.section), alert: 'Campo não pode ser excluída: existem trabalhos que usam esse template.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_params
      params.require(:field).permit(:name, :label, :open_tag, :close_tag, :position, :section_id, :is_multivalue)
    end

    def set_section
      @section = Section.find(params[:section_id])
    end

    def set_count
      @count = @section.fields.count
    end
end
