# frozen_string_literal: true

class Clubs::SessionsController < Devise::SessionsController
  respond_to :json
end
