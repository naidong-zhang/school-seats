class SchoolDivisionWardsController < ApplicationController
  before_action :set_school_division_ward, only: %i[ show edit update destroy ]

  # GET /school_division_wards or /school_division_wards.json
  def index
    @school_division_wards = SchoolDivisionWard.all
  end

  # GET /school_division_wards/1 or /school_division_wards/1.json
  def show
  end

  # GET /school_division_wards/new
  def new
    @school_division_ward = SchoolDivisionWard.new
  end

  # GET /school_division_wards/1/edit
  def edit
  end

  # POST /school_division_wards or /school_division_wards.json
  def create
    @school_division_ward = SchoolDivisionWard.new(school_division_ward_params)

    respond_to do |format|
      if @school_division_ward.save
        format.html { redirect_to school_division_ward_url(@school_division_ward), notice: "School division ward was successfully created." }
        format.json { render :show, status: :created, location: @school_division_ward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_division_ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_division_wards/1 or /school_division_wards/1.json
  def update
    respond_to do |format|
      if @school_division_ward.update(school_division_ward_params)
        format.html { redirect_to school_division_ward_url(@school_division_ward), notice: "School division ward was successfully updated." }
        format.json { render :show, status: :ok, location: @school_division_ward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_division_ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_division_wards/1 or /school_division_wards/1.json
  def destroy
    @school_division_ward.destroy

    respond_to do |format|
      format.html { redirect_to school_division_wards_url, notice: "School division ward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_division_ward
      @school_division_ward = SchoolDivisionWard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_division_ward_params
      params.require(:school_division_ward).permit(:name, :school_division_id, :ward_id)
    end
end
