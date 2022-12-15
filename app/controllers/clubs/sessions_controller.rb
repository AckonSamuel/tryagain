# frozen_string_literal: true

module Clubs
  class SessionsController < Devise::SessionsController
    respond_to :json
  end
end
