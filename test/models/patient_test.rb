# == Schema Information
#
# Table name: patients
#
#  id           :integer          not null, primary key
#  first_name   :string(30)
#  middle_name  :string(10)
#  last_name    :string(30)
#  birth        :datetime
#  gender       :integer
#  status       :integer
#  location_id  :integer
#  viewed_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_length_of(:first_name).is_at_most(30)
  should validate_presence_of(:first_name)
  should validate_length_of(:middle_name).is_at_most(10)
  should validate_length_of(:last_name).is_at_most(30)
  should validate_presence_of(:last_name)
  should validate_presence_of(:location_id)
  should validate_presence_of(:status)
end
