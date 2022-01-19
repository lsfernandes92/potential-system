class ApplicationController < ActionController::API

  before_action :ensure_mime_types

  def ensure_mime_types
    ensure_accept
    ensure_content_type
  end

  private

    def ensure_accept
      return if accept?
      render nothing: true, status: :not_acceptable
    end

    def ensure_content_type
      unless request.get?
        return if content_type?
        render nothing: true, status: :unsupported_media_type
      end
    end

    def content_type?
      request.headers["Content-Type"] == 'application/vnd.api+json'
    end

    def accept?
      request.headers['Accept'] == 'application/vnd.api+json'
    end
end
