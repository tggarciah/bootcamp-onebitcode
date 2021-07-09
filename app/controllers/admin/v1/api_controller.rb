module Admin::V1
  class ApiController < ApplicationController
    class ForbbidenAccess < StandardError; end

    include Authenticable

    before_action :restrict_access_for_admin!

    def render_error(message: nil, fields: nil, status: :unprocessable_entity)
      errors = {}
      errors['fields'] = fields if fields.present?
      errors['message'] = message if message.present?
      render json: { errors: errors }, status: status
    end

    rescue_from ForbbidenAccess do
      render_error(message: "Forbidden access", status: :forbidden)
    end

    private

    def restrict_access_for_admin!
      raise ForbbidenAccess unless current_user.admin? # current_user é uma entidade do divise token auth que tem info do usuário atual
    end
  end
end
