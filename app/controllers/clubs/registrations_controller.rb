# frozen_string_literal: true

module Clubs
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      club = Club.create(club_params)
      if club.valid? && club.save
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
        :password,
        :password_confirmation
      )
    end
  end
end
