# frozen_string_literal: true

class AdminsController < ApplicationController
    before_action :set_admin
    before_action :authenticate_admin!
  
    def index
        clubs = Club.all
      render json: clubs, status: :ok
    end

    def show_admin
        render json: @admin, status: :ok
    end
  
    def show_club
        club = Club.find(params[:club_id])
      render json: club, status: :ok
    end
  
    def set_year
        academic_year = AcademicYear.new(academic_year_params)
        academic_year.admin = current_admin
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
        club = Club.find(params[:club_id])
        club.is_approved = params[:is_approved]
        if club.save
            render json: club, status: :ok
        else
            render json: club.errors, status: :unprocessable_entity
        end
    end

    def delete_application
        Club.find(params[:club_id]).destroy!
    end
  
    private
  
    def set_admin
      @admin = admin.find(params[:admin_id])
    end

    def academic_year_params
        params.require(:academic_year).permit(:start_year, :end_year, :is_active)
    end

    def fees_params
        params.require(:fee).permit(:application_type, :amount)
    end
  
  end
  