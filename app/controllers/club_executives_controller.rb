# frozen_string_literal: true

class ClubExecutivesController < ApplicationController
  before_action :set_club_executives
  # before_action :authenticate_club!

  def index
    club_executive = @club.club_executives.all
    render json: club_executive, status: :ok
  end

  def show
    club_executive = @club.club_executives.find(params[:executive_id])
    render json: club_executive
  end

  def create
    @club.club_executives.create(club_executives_params)

    if @club.save
      render json: @club, status: :created
    else
      render json: @club.errors, status: :unprocessable_entity
    end
  end

  def update
    if @club.club_executives.find(params[:executive_id]).update(club_executives_params)
      render json: @club, status: :created
    else
      render json: @club.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @club.club_executives.find(params[:executive_id]).destroy!
  end

  private

  def set_club_executives
    @club = Club.find(params[:club_id])
  end

  def club_executives_params
    params.require(:club_executive).permit(
      :executive_name,
      :portfolio,
      :contact,
      :programme,
      :email
    )
  end
end
