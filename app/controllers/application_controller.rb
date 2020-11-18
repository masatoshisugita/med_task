class ApplicationController < ActionController::API
  def response_success
    render status: 201, json: { status: 201, message: "Success" }
  end
  
  def not_found_error
    render status: 404, json: { status: 404, message: "Not Found" }
  end

  def response_error
    render status: 422, json: { status: 422, message: "Error" }
  end
end
