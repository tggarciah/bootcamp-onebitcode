module Admin::V1
  class CategoriesController < ApiController
    def index
      @categories = Category.all
    end

    def create
      @category = Category.new
      @category.attributes = category_params

      save_category!
    end

    def update
      @category = Category.find(params[:id])
      @category.attributes = category_params
      save_category!
    end

    private

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
