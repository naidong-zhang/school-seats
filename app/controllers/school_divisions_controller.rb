class SchoolDivisionsController < ApplicationController
  before_action :set_school_division, only: %i[show edit update destroy]

  # GET /school_divisions or /school_divisions.json
  def index
    @school_divisions_count = SchoolDivision.count
    @school_divisions_per_page = SchoolDivision.order(:name).page params[:page]
  end

  # GET /school_divisions/1 or /school_divisions/1.json
  def show; end

  # GET /school_divisions/new
  def new
    @school_division = SchoolDivision.new
  end

  # GET /school_divisions/1/edit
  def edit; end

  # POST /school_divisions or /school_divisions.json
  def create
    @school_division = SchoolDivision.new(school_division_params)

    respond_to do |format|
      if @school_division.save
        format.html do
          redirect_to school_division_url(@school_division),
                      notice: "School division was successfully created."
        end
        format.json { render :show, status: :created, location: @school_division }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_divisions/1 or /school_divisions/1.json
  def update
    respond_to do |format|
      if @school_division.update(school_division_params)
        format.html do
          redirect_to school_division_url(@school_division),
                      notice: "School division was successfully updated."
        end
        format.json { render :show, status: :ok, location: @school_division }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_divisions/1 or /school_divisions/1.json
  def destroy
    @school_division.destroy

    respond_to do |format|
      format.html do
        redirect_to school_divisions_url, notice: "School division was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_school_division
    @school_division = SchoolDivision.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def school_division_params
    params.require(:school_division).permit(:name)
  end
end
