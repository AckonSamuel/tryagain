# frozen_string_literal: true

class ClubPatronsController < ApplicationController
  before_action :set_club
  before_action :authenticate_club!

  def index
    club_patrons = @club_patron.club_patrons.all

    render json: club_patrons
  end

  def show
    club_patron = @club_patron.club_patrons.find(params[:id])
    render json: club_patron
  end

  def create
    @club_patron.club_patrons.create(club_patrons_params)

    if @club_patron.save
      render json: @club_patron, status: :created
    else
      render json: @club_patron.errors, status: :unprocessable_entity
    end
  end

  def update
    if @club_patron.update(club_patrons_params)
      render json: @club_patron, status: :created
    else
      render json: @club_patron.errors, status: :unprocessable_entity
    end
  end

  private

  def set_club_patrons
    @club_patron = Club.find(params[:id])
  end

  def club_patrons_params
    params.require(:club_patron).permit(
      :office_in_knust,
      :patron_name,
      :contact,
      :constitution
    )
  end
end
