class ClubExecutivesController < ApplicationController
    before_action :set_club
    before_action :authenticate_club

    def index
        club_executive = @club_executive.club_executives.all
        render json: club_executive, status: :ok
    end

    def show
        club_executive = @club_executive.club_executives.find(params[:id])
        render json: club_executive
    end

    def create
        @club_executive.club_executives.create(club_executives_params)

        if @club_executive.save
            render json: @club_executive, status: :created
        else
            render json: @club_executive.errors, status: :unprocessable_entity
        end
    end

    def update
        if @club_executive.update(club_executives_params)
            render json: @club_executive, status: :created
        else
            render json: @club_executive.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @club_executive.club_executives.find(params[:id])
    end

    private

    def set_club_executives
        @club_executive = Club.find(params[:id])
    end

    def club_executives_params
        params.require(:club_executive).permit(
            :executive_name,
            :portfolio,
            :contact,
            :programme,
            :email,
        )
    end
end
