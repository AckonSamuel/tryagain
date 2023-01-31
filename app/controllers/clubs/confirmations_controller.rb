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
    def show
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?

      if resource.errors.empty?
        set_flash_message!(:notice, :confirmed)
        
        html = "<h1>Email has been verified</h1>\n"
        html += "<h2>Please click on <a href='https://tryagain-view.vercel.app' alt='reset form'>this link</a> to redirect to sign in page</h2>"
        render html: html.html_safe, status: :ok
      else
        respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
      end
    end

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
