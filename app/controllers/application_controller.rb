# frozen_string_literal: true

class ApplicationController < ActionController::API
    include ActionController::MimeResponds

  def default_url_options
    {
      host: 'tryagainclub.s3.amazonaws.com',
      protocol: 'https'
    }
  end
end
