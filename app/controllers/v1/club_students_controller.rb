# frozen_string_literal: true

class V1::ClubStudentsController < ApplicationController
  before_action :set_club_student, only: %i[show update destroy]

  # GET /club_students
  def index
    @club_students = ClubStudent.all

    render json: @club_students
  end

  # GET /club_students/1
  def show
    render json: @club_student
  end

  # POST /club_students
  def create
    @club_student = ClubStudent.new(club_student_params)

    if @club_student.save
      render json: @club_student, status: :created, location: @club_student
    else
      render json: @club_student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /club_students/1
  def update
    if @club_student.update(club_student_params)
      render json: @club_student
    else
      render json: @club_student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /club_students/1
  def destroy
    @club_student.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_club_student
    @club_student = ClubStudent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def club_student_params
    params.require(:club_student).permit(:club_id, :student_id)
  end
end
