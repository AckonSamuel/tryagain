# frozen_string_literal: true

module Clubs
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      club = Club.create(club_params)
      if club.valid? && club.
        club.send_confirmation_instructions unless club.confirmed?
        # current_year = AcademicYear.where(is_active: true).order(end_year: :desc).first
        # current_admin = User.where(admin: true)
        # current_year_club = AcademicyearClub.create(club: club, academic_year: current_year)
        # current_admin_club_year = AdminClubsYear.create(user: current_admin, club: current_year, academic)
        render json: club,
               status: 201
        return
      end
      render json: club.errors,
             status: 400
    end

    private

    def club_params
      params.require(:club).permit(
        :club_name,
        :email,
        :telephone_number,
        :group,
        :password,
        :password_confirmation
      )
    end
  end
end
