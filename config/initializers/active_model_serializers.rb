# frozen_string_literal: true

ActiveModel::Serializer.config.adapter = :json
ActiveModelSerializers.config.key_transform = :underscore
