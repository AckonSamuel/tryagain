# frozen_string_literal: true

module V1
  class ClubsController < ApplicationController
    before_action :set_club, only: %i[show update destroy]

    # # login as club
    # def login
    #   email = params[:club][:email]
    #   password = params[:club][:password]
    #   club = Club.find_by(email:)
    #   is_valid = club&.valid_password?(password)
    #   unless is_valid
    #     render json: {
    #       status: 'error',
    #       message: 'Invalid club credentials'
    #     }, status: 400 and return
    #   end

    #   render json: club,
    #          status: 200
    # end

    # # register as club
    # def register
    #   club = Club.create(club_params)
    #   if club.valid? && club.save
    #     render json: club,
    #            status: 201
    #     return
    #   end
    #   render json: club.errors,
    #          status: 400
    # end

    # GET /clubs
    def index
      @clubs = Club.all

      render json: @clubs
    end

    # GET /clubs/1
    def show
      render json: @club
    end

    # # POST /clubs
    # def create
    #   @club = Club.new(club_params)

    #   if @club.save
    #     render json: @club, status: :created, location: @club
    #   else
    #     render json: @club.errors, status: :unprocessable_entity
    #   end
    # end

    # PATCH/PUT /clubs/1
    def update
      if @club.update(club_params)
        render json: @club
      else
        render json: @club.errors, status: :unprocessable_entity
      end
    end

    # DELETE /clubs/1
    def destroy
      @club.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
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
