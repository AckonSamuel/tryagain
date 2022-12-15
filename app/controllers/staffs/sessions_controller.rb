# frozen_string_literal: true

module Staffs
  class SessionsController < Devise::SessionsController
    respond_to :json
  end
end
