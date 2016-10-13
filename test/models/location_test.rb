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
end
