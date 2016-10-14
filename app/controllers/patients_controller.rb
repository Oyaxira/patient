class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :update, :destroy, :edit]
  before_action :incr_view_count, only: :show

  def new
    @patient = Patient.new
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
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
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
      param = params.require(:patient).permit(:first_name,
                                      :middle_name,
                                      :last_name,
                                      :gender,
                                      :status,
                                      :location_id)
      if params[:birth]
          birth = Date.civil(params[:birth]["birth(1i)"].to_i, params[:birth]["birth(2i)"].to_i, params[:birth]["birth(3i)"].to_i)
          param["birth"] = birth
      end
      param
    end
end
