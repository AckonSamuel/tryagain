# frozen_string_literal: true

module Students
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      student = Student.create(student_params)
      if student.valid? && student.save
        render json: student,
               status: 201
        return
      end
      render json: student.errors,
             status: 400
    end

    private

    def student_params
      params.require(:student).permit(
        :name,
        :email,
        :phone_number,
        :programme_name,
        :password,
        :password_confirmation
      )
    end
  end
end
