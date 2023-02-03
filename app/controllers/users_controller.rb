# frozen_string_literal: true

class UsersController < ApplicationController
    before_action :set_user
    before_action :authenticate_user!
  
    def index
        clubs = Club.all
      render json: clubs, status: :ok
    end
  
    def show
        club = Club.find(params[:id])
      render json: club, status: :ok
    end
  
    def set_year
        academic_year = AcademicYear.create(academic_year_params)
        if academic_year.save
            YearWorker.perform(academic_year.start_year)
            render json: academic_year, status: :ok
        else
            render json: academic_year.errors, status: :unprocessable_entity
        end
    end
  
    def setfees
        academic_year = AcademicYear.where( is_active: true ).order(created_at: :desc).first
        fees = Fee.create(academic_year: academic_year, **fees_params)
        if fees.save
            render json: fees, status: :ok
        else
            render json: fees.errors, status: :unprocessable_entity
        end
    end
  

    def approve_club
        club = Club.find(params[:id])
        club.is_approved = params[:is_approved]
        if club.save
            render json: club, status: :ok
        else
            render json: club.errors, status: :unprocessable_entity
        end
    end

    def delete_application
        Club.find(params[:id]).destroy!
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end

    def academic_year_params
        params.require(:academic_year).permit(:start_year, :end_year, :is_active)
    end

    def fees_params
        params.require(:fee).permit(:application_type, :amount)
    end
  
  end
  