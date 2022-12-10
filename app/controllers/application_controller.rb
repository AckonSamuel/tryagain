# frozen_string_literal: true

class ApplicationController < ActionController::API
    def register
        user = User.create(user_params)
        if user.valid? && user.save
            render json: user,
            status: 201
            return
        end
        render json: user.errors,
          status: 400
    end

    private

    def user_params
        params.require(:user).permit(
            :email,
            :password,
            :password_confirmation,
        )
    end
end
