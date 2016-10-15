require 'test_helper'

class LocationShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @location = create(:location)
  end

  test "can see the location show with patient" do
    3.times do
       create(:patient, location: @location)
    end
    create(:patient)
    get location_path(@location)
    assert_response :success
    assert_select "ul" , 3
  end
end
