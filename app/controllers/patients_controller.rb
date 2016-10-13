class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :update, :destroy]

  def new
  end

  def index
    @patients = Patient.all
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

    def patient_params
      birth = Date.civil(params[:birth][:year].to_i, params[:birth][:month].to_i, params[:birth][:day].to_i)
      param = params.require(:patient).permit(:first_name,
                                      :middle_name,
                                      :last_name,
                                      :birth,
                                      :gender,
                                      :status,
                                      :location_id)
      param["birth"] = birth
      param
    end
end
