# frozen_string_literal: true

module Clubs
  class SessionsController < Devise::SessionsController
    respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    if resource.confirmed?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      set_flash_message!(:error, :unconfirmed_email)
      respond_with({error: "Please confirm your email address before signing in"}, status: :unprocessable_entity)
    end
  end    

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
      if current_club
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
