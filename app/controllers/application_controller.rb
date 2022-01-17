class ApplicationController < ActionController::API

  before_action :ensure_json_mime_type

  def ensure_json_mime_type
    return if request.headers['Accept'] == 'application/vnd.api+json'
    render nothing: true, status: :not_acceptable
  end
end
