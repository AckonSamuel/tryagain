# frozen_string_literal: true

module Students
  class SessionsController < Devise::SessionsController
    respond_to :json

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

    def respond_with(resource, _opts = {})
      render json: {
        status: {code: 200, message: 'Logged in sucessfully.'},
        data: resource,
        accessToken: current_token
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_student
        render json: {
          status: 200,
          message: "logged out successfully"
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
  end
end
