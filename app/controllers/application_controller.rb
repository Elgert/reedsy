class ApplicationController < ActionController::API
  protected

  def not_found
    render json: {
      errors:
        [{ code: 404,
           status: 404,
           title: 'not_found',
           detail: 'Record not found' }]
    }, status: :not_found
  end
end
