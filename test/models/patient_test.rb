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
end
