class ApplicationController < ActionController::API
  def response_success
    render status: :created, json: { status: 201, message: 'Success' }
  end

  def not_found_error
    render status: :not_found, json: { status: 404, message: 'Not Found' }
  end

  def response_error
    render status: :unprocessable_entity, json: { status: 422, message: 'Error' }
  end
end
