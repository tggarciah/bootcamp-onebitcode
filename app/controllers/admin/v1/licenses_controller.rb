module Admin::V1
  class LicensesController < ApiController
    before_action :load_license, only: [:update, :destroy, :show]

    def index
      game_licenses = License.where(game_id: params[:game_id])
      @loading_service = Admin::ModelLoadingService.new(game_licenses, searchable_params)
      @loading_service.call
    end

    def create
      @license = License.new(game_id: params['game_id'])
      @license.attributes = license_params

      save_license!
    end

    def show; end

    def update
      # @license = License.find(params[:id]) código refatorado para o before_action
      @license.attributes = license_params
      save_license!
    end

    def destroy
      # @license = License.find(params[:id]) código refatorado para o before_action
      @license.destroy!
    rescue
      render_error(fields: @license.errors.messages)
    end

    private

    def load_license
      @license = License.find(params[:id])
    end

    def searchable_params
      params.permit({ search: :key }, { order: {} }, :page, :length)
    end

    def license_params
      return {} unless params.has_key?(:license)
      params.require(:license).permit(:id, :key, :platform, :status)
    end

    def save_license!
      @license.save! # pega os parametros processados pelo método license_params e salva no BD o (!) é para retornar o erro
      render :show
    rescue
      # a linha abaixo foi inserida no arquivo api_controller por questão de centralização do render de erro
      # render json: { errors: { fields: @license.errors.messages } }, status: :unprocessable_entity
      render_error(fields: @license.errors.messages)
    end
  end
end
