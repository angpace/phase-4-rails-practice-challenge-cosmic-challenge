class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :do_not_render
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  

    def do_not_render(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def not_found(invalid)
        render json: { error: "#{invalid.model} not found" }, status: :not_found
    end
end
