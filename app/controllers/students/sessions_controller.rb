# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
respond_to :json
private

def respond_with(resource, opts = {})
  render json: resource
end

def respond_to_on_destroy
  render json: { message: 'Logged out.'}
end
end

