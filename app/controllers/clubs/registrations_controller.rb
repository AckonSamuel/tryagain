# frozen_string_literal: true

module Clubs
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      club = Club.new(club_params)
      club.academic_years = AcademicYear.where( is_active: true ).order(created_at: :desc).first
      if club.valid? && club.save
        club.send_confirmation_instructions unless club.confirmed?
        render json: club, status: :created
        return
      else
      render json: club.errors,
             status: 400
      end
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
