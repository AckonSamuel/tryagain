# frozen_string_literal: true

module Admins
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
  
    end
  end
  