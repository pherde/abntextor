class PapersController < ApplicationController
  authorize_resource
  before_action :set_paper, only: [:show, :update]
  before_action :set_templates, only: [:new]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.from_user(current_user.id).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.from_hash_name(params[:hash_name])
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to papers_path, notice: 'Trabalho criado com sucesso.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to papers_path, notice: 'Trabalho alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper = Paper.from_hash_name(params[:hash_name])
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Trabalho excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:name, :template_id, :user_id)
    end

    def set_templates
      @templates = Template.active
    end
end
