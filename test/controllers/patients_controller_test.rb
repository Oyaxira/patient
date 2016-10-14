require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @patient = create(:patient)
  end

  test "should create" do
    patient = build :patient
    assert_difference "Patient.count", 1 do
      post :create, params: { patient: {
                            first_name: patient.first_name,
                            middle_name: patient.middle_name,
                            last_name: patient.last_name,
                            gender: patient.gender,
                            status: patient.status,
                            location_id: patient.location.id
        }
      }
    end
    assert_redirected_to patient_path(Patient.last)
  end

  test "should not create" do
    patient = build :patient
    assert_difference "Patient.count", 0 do
      post :create, params: { patient: {
                            middle_name: patient.middle_name,
                            last_name: patient.last_name,
                            gender: patient.gender,
                            status: patient.status,
                            location_id: patient.location.id
        }
      }
    end
    assert_template :new
  end

  test "should update" do
    put :update, params: { id: @patient.id, patient: {
                          last_name: "123456"
      }
    }
    assert_redirected_to patient_path(@patient)
  end

  test "should not update" do
    put :update, params: { id: @patient.id, patient: {
                          last_name: ""
      }
    }
    assert_template :edit
  end

  test "should destroy" do
    delete :destroy, params: { id: @patient.id }
    assert_redirected_to patients_path
  end
end
