# frozen_string_literal: true

class ApplicationController < ActionController::API
    private

    def user_params
        params.require(:user).permit(
            :email,
            :password,
            :password_confirmation,
        )
    end
end
