# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  code       :string(10)
#  name       :string(80)
#  patient_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should validate_length_of(:code).is_at_most(10)
  should validate_length_of(:name).is_at_most(80)
  should validate_presence_of(:name)
  should have_many(:patients)
end
