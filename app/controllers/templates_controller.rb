class TemplatesController < ApplicationController
  authorize_resource
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  before_action :set_count, only: [:new, :create, :edit, :update]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
    @count = @count + 1
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  # POST /templates.json
  def create
    @count = @count + 1
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to session.delete(:referer), notice: 'Template criado com sucesso.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to session.delete(:referer), notice: 'Template atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    if @template.destroy
      respond_to do |format|
        format.html { redirect_to templates_url, notice: 'Template excluído com sucesso.' }
        format.json { head :no_content }
      end
    else
      redirect_to templates_url, alert: 'Template não pode ser excluído: existem trabalhos que usam esse template.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:name, :description, :position,:is_active)
    end
    def set_count
      @count = Template.all.count
    end
end
