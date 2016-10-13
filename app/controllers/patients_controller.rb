class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :update, :destroy, :edit]
  before_action :incr_view_count, only: :show

  def new
  end

  def index
    @patients = Patient.all.includes(:location)
  end

  def show
  end


  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
  end

  def update
    @patient.update(patient_params)
  end

  def destroy
    @patient.destroy
  end

  private
    def find_patient
      @patient = Patient.find(params[:id])
    end

    def incr_view_count
      @patient.viewed_count += 1
      @patient.save
    end
    def patient_params
      birth = Date.civil(params[:birth]["birth(1i)"].to_i, params[:birth]["birth(2i)"].to_i, params[:birth]["birth(3i)"].to_i)
      param = params.require(:patient).permit(:first_name,
                                      :middle_name,
                                      :last_name,
                                      :birth,
                                      :gender,
                                      :status,
                                      :location_id)
      param["birth"] = birth
      param["status"] = param["status"].to_i
      param
    end
end
