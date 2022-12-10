# frozen_string_literal: true

class V1::ExecutivesController < ApplicationController
  before_action :set_executive, only: %i[show update destroy]

  # GET /executives
  def index
    @executives = Executive.all

    render json: @executives
  end

  # GET /executives/1
  def show
    render json: @executive
  end

  # POST /executives
  def create
    @executive = Executive.new(executive_params)

    if @executive.save
      render json: @executive, status: :created, location: @executive
    else
      render json: @executive.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /executives/1
  def update
    if @executive.update(executive_params)
      render json: @executive
    else
      render json: @executive.errors, status: :unprocessable_entity
    end
  end

  # DELETE /executives/1
  def destroy
    @executive.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_executive
    @executive = Executive.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def executive_params
    params.require(:executive).permit(:portfolio, :club_student_id)
  end
end
