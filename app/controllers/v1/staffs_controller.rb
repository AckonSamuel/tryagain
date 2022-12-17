# frozen_string_literal: true

module V1
  class StaffsController < ApplicationController
    before_action :set_staff, only: %i[show update destroy]

    # GET /staffs
    def index
      @staffs = Staff.all

      render json: @staffs
    end

    # GET /staffs/1
    def show
      render json: @staff
    end

    # PATCH/PUT /staffs/1
    def update
      if @staff.update(staff_params)
        render json: @staff
      else
        render json: @staff.errors, status: :unprocessable_entity
      end
    end

    # DELETE /staffs/1
    def destroy
      @staff.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(
        :staff_name,
        :email,
        :phone_number,
        :password,
        :role,
        :password_confirmation
      )
    end
  end
end
