# frozen_string_literal: true

module Clubs
  class PasswordsController < Devise::PasswordsController
    respond_to :json

    def create
      self.resource = resource_class.send_reset_password_instructions(resource_params)
      yield resource if block_given?

      if successfully_sent?(resource)
        render json: { message: 'Password reset instructions sent to your email' }, status: :ok
      else
        render json: { error: 'Unable to send password reset instructions' }, status: :bad_request
      end
    end

    def update
      self.resource = resource_class.reset_password_by_token(resource_params)
      yield resource if block_given?

      if resource.errors.empty?
        resource.unlock_access! if unlockable?(resource)
        resource.after_database_authentication if Devise.sign_in_after_reset_password
        render json: { status: 'success', message: 'Password reset successfully' }
      else
        render json: { status: 'error', message: resource.errors.full_messages.join(', ') }
      end
    end
  end
end
