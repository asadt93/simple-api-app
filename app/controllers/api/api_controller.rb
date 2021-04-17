# frozen_string_literal: true

module Api
  class ApiController < ActionController::API
    include Knock::Authenticable
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    before_action :authenticate_user

    def render_error(resource)
      render json: resource, status: :unprocessable_entity, adapter: :json_api,
             serializer: ActiveModel::Serializer::ErrorSerializer
    end
    
    def _run_options(options)
      options.merge('set_options' => set_options)
    end

    def set_options
      options = {}
      options[:include] = params.fetch(:include, '').split(',') || []
      options
    end

    def render_404
      render json: { errors: [detail: 'Resource not found'] }, status: :not_found
    end

    def unauthorized_entity(_entity_name)
      render json: { errors: [detail: 'Unauthorized!'] }, status: :unauthorized
    end
  end
end
