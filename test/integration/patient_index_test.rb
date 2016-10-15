require 'test_helper'

class PatientIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @patient = create(:patient)
  end

  test "can see the patients index" do
    get patients_path
    assert_response :success
  end

  test "can see the patient show" do
    get patient_path(@patient)
    assert_response :success
  end


  test "can create a patient" do
    get new_patient_path
    assert_response :success
    patient = build :patient
    post patients_path, params: { patient: {
                          first_name: patient.first_name,
                          middle_name: patient.middle_name,
                          last_name: patient.last_name,
                          gender: patient.gender,
                          status: patient.status,
                          location_id: patient.location.id
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "ul" do |e|
      assert_select "li", 7
    end
  end

  test "can update a patient" do
    get edit_patient_path(@patient)
    assert_response :success
    patient = build :patient
    put patient_path(@patient), params: { id: @patient.id, patient: {
                          first_name: patient.first_name,
                          middle_name: patient.middle_name,
                          last_name: patient.last_name,
                          gender: patient.gender,
                          status: patient.status,
                          location_id: patient.location.id
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "ul" do |e|
      assert_select "li", 7
    end
  end
end
