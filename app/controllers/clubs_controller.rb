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
      end

      if params[:constitution].present?
        @club.constitution.purge
        @club.constitution.attach(params[:constitution])

        if @club.save
          render json: {
            constitution_url: url_for(@club.constitution)
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end
      end

      if params[:endorsement_letter].present?
        @club.endorsement_letter.purge
        @club.endorsement_letter.attach(params[:endorsement_letter])

        if @club.save
          render json: {
            endorsement_letter_url: url_for(@club.endorsement_letter)
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end
      end

      if params[:registration_application_letter].present?
        @club.registration_application_letter.purge
        @club.registration_application_letter.attach(params[:registration_application_letter])

        if @club.save
          render json: {
            registration_application_letter_url: url_for(@club.registration_application_letter)
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end
      end

      if params[:passport_photos].present?
        @club.passport_photos.each do |photo|
          photo.purge
        end
        params[:passport_photos].each do |photo|
          @club.passport_photos.attach(photo)
        end

        if @club.save
          passport_photos_url = @club.passport_photos.map { |photo| url_for(photo)}
          render json: {
            passport_photos_url: passport_photos_url
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end
      end

      if params[:banner_photo].present?
        @club.banner_photo.purge
        @club.banner_photo.attach(params[:banner_photo])

        if @club.save
          render json: { 
            banner_photo_url: url_for(@club.banner_photo)
          }, status: :created
        else
          render json: @club.errors, status: :unprocessable_entity
        end
      end

      if @club.update(club_params) || @club.save
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
        :constitution,
        :endorsement_letter,
        :registration_application_letter,
        passport_photos: []
      )
    end
  end

