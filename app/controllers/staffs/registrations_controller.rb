# frozen_string_literal: true

module Staffs
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    def create
      staff = Staff.create(staff_params)
      if staff.valid? && staff.save
        render json: staff,
               status: 201
        return
      end
      render json: staff.errors,
             status: 400
    end

    private

    def staff_params
      params.require(:staff).permit(
        :name,
        :email,
        :phone_number,
        :password,
        :role,
        :password_confirmation
      )
    end
  end
end
