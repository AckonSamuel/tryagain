# frozen_string_literal: true

module Clubs
  class ConfirmationsController < Devise::ConfirmationsController
    # GET /resource/confirmation/new
    # def new
    #   super
    # end

    # POST /resource/confirmation
    # def create
    #   super
    # end

    # GET /resource/confirmation?confirmation_token=abcdef
    # def show
    #   super
    # end

    protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(_resource_name)
      ENV['CONFIRMATION_PATH']
    end

    # The path used after confirmation.
    def after_confirmation_path_for(_resource_name, _resource)
      ENV['CONFIRMATION_PATH']
    end
  end
end
