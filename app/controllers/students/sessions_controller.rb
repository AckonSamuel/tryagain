# frozen_string_literal: true

module Students
  class SessionsController < Devise::SessionsController
    respond_to :json
  end
end
