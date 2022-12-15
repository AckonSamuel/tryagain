# frozen_string_literal: true

class Clubs::RegistrationsController < Devise::RegistrationsController
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
        :name,
        :email,
        :telephone_number,
        :group,
        :password,
        :password_confirmation
      )
  end
end
