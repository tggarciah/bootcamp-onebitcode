module Admin::V1
  class CategoriesController < ApiController

    before_action :load_category, only: [:update, :destroy, :show]

    def index
      @categories = load_categories
    end

    def create
      @category = Category.new
      @category.attributes = category_params

      save_category!
    end

    def show; end

    def update
      # @category = Category.find(params[:id]) código refatorado para o before_action
      @category.attributes = category_params
      save_category!
    end

    def destroy
      # @category = Category.find(params[:id]) código refatorado para o before_action
      @category.destroy!
    rescue
      render_error(fields: @category.errors.messages)
    end

    private

    def load_category
      @category = Category.find(params[:id])
    end

    def load_categories
      permited = params.permit({ search: :name }, { order: {} }, :page, :length)
      Admin::ModelLoadingService.new(Category.all, permited).call
    end

    def category_params
      return {} unless params.has_key?(:category)

      params.require(:category).permit(:name)
    end

    def save_category!
      @category.save! # pega os parametros processados pelo método category_params e salva no BD o (!) é para retornar o erro
      render :show
    rescue
      # a linha abaixo foi inserida no arquivo api_controller por questão de centralização do render de erro
      # render json: { errors: { fields: @category.errors.messages } }, status: :unprocessable_entity
      render_error(fields: @category.errors.messages)
    end
  end
end
