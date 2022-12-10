# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]

  # POST /student
  def register
    student = Student.create(student_params)
    if student.valid? && student.save
      render json: student,
             status: 201
      return
    end
    render json: student.errors,
           status: 400
  end

  def login
    email = params[:student][:email]
    password = params[:student][:password]
    student = Student.find_by(email: email)
    is_valid = student&.valid_password?(password)
    unless is_valid
      render json: {
        status: 'error',
        message: 'Invalid student credentials'
      }, status: 400 and return
    end

    render json: student,
           status: 200
  end

  # GET /students
  def index
    @students = Student.all

    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  # def create
  #   @student = Student.new(student_params)

  #   if @student.save
  #     render json: @student, status: :created, location: @student
  #   else
  #     render json: @student.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(
      :name, 
      :email, 
      :phone_number, 
      :programme_name,
      :password,
      :password_confirmation,)
  end
end
