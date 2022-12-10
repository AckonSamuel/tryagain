# frozen_string_literal: true

class ClubStaffsController < ApplicationController
  before_action :set_club_staff, only: %i[show update destroy]

  # GET /club_staffs
  def index
    @club_staffs = ClubStaff.all

    render json: @club_staffs
  end

  # GET /club_staffs/1
  def show
    render json: @club_staff
  end

  # POST /club_staffs
  def create
    @club_staff = ClubStaff.new(club_staff_params)

    if @club_staff.save
      render json: @club_staff, status: :created, location: @club_staff
    else
      render json: @club_staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /club_staffs/1
  def update
    if @club_staff.update(club_staff_params)
      render json: @club_staff
    else
      render json: @club_staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /club_staffs/1
  def destroy
    @club_staff.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_club_staff
    @club_staff = ClubStaff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def club_staff_params
    params.require(:club_staff).permit(:club_id, :staff_id)
  end
end
