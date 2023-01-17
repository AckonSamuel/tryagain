# frozen_string_literal: true

  class ClubsController < ApplicationController
    before_action :set_club, only: %i[show update destroy]
    before_action :authenticate_club, only: %i[update, destroy]

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
      if params[:profile_photo].present?
        @club.profile_photo.purge
        @club.profile_photo.attach(params[:profile_photo])

        if @club.save
          render json: { 
            profile_photo_url: url_for(@club.profile_photo)
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end

      elsif params[:banner_photo].present?
        @club.banner_photo.purge
        @club.banner_photo.attach(params[:banner_photo])

        if @club.save
          render json: { 
            banner_photo_url: url_for(@club.banner_photo)
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end
        
      elsif @club.update(club_params)
        render json: @club, status: :ok
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
        :password_confirmation,
        :banner_photo,
        :profile_photo,
        :history,
        :description,
        :meeting_location,
        :meeting_time,
      )
    end
  end

