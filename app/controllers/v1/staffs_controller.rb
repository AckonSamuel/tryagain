# frozen_string_literal: true

class StaffsController < ApplicationController
  before_action :set_staff, only: %i[show update destroy]
  # Register as Staff
  def register
    staff = Staff.create(staff_params)
    if staff.valid? && staff.save
      render json: staff,
             status: 201
      return
    end
    render json: staff.errors,
           status: 400
  end

  # Login as Staff
  def login
    email = params[:staff][:email]
    password = params[:staff][:password]
    staff = Staff.find_by(email: email)
    is_valid = staff&.valid_password?(password)
    unless is_valid
      render json: {
        status: 'error',
        message: 'Invalid staff credentials'
      }, status: 400 and return
    end

    render json: staff,
           status: 200
  end

  # GET /staffs
  def index
    @staffs = Staff.all

    render json: @staffs
  end

  # GET /staffs/1
  def show
    render json: @staff
  end

  # POST /staffs
  # def create
  #   @staff = Staff.new(staff_params)

  #   if @staff.save
  #     render json: @staff, status: :created, location: @staff
  #   else
  #     render json: @staff.errors, status: :unprocessable_entity
  #   end
  # end

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
      :name, 
      :email, 
      :phone_number,
      :password,
      :role,
      :password_confirmation,)
  end
end
