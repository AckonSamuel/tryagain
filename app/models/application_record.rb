# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def default_url_options
    {
      host: 'tryagainclub.s3.amazonaws.com',
      protocol: 'https'
    }
  end
end
