class PatronsController < ApplicationController
  before_action :set_patron, only: %i[ show update destroy ]

  # GET /patrons
  def index
    @patrons = Patron.all

    render json: @patrons
  end

  # GET /patrons/1
  def show
    render json: @patron
  end

  # POST /patrons
  def create
    @patron = Patron.new(patron_params)

    if @patron.save
      render json: @patron, status: :created, location: @patron
    else
      render json: @patron.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patrons/1
  def update
    if @patron.update(patron_params)
      render json: @patron
    else
      render json: @patron.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patrons/1
  def destroy
    @patron.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patron
      @patron = Patron.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patron_params
      params.require(:patron).permit(:club_staff_id)
    end
end
