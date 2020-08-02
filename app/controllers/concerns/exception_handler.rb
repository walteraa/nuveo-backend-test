module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_errors(e, status: :not_found, error: :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid, Object::NameError, ArgumentError do |e|
      json_errors(e, status: :unprocessable_entity)
    end

    private

    def json_errors(exception, options = {})
      errors = exception.is_a?(ActiveRecord::Base) ? exception.errors : exception.message

      render json: { errors: [errors || 'invalid data'],
                     error_details: errors }, status: options[:status]
    end
  end
end
