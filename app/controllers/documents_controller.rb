class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.ordering.page(params[:page])
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to documents_url, notice: 'Документ успешно добавлен.'
    else
      render :new
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    if @document.update(document_params)
      redirect_to documents_url, notice: 'Параметры изменены.'
    else
      render :edit
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    if @document.destroy
      redirect_to documents_url, notice: 'Сотрудник удален из базы.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:doc, :title, :post_id)
    end
end
