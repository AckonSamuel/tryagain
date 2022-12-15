# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  respond_to :json
end
