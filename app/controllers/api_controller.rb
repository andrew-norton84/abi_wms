class ApiController < ApplicationController
  skip_forgery_protection
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :set_default_format

  private

    def set_default_format
      request.format = :json
    end

    def not_found
      render json: "Record not found", status: :not_found
    end

    def not_destroyed(e)
      render json: { errors: e.record.errors }, status: :unprocessable_entity
    end
end
