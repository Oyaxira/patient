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
  should validate_length_of(:first_name).is_at_most(30).with_message("名字长度必须小于30")
  should validate_presence_of(:first_name).with_message("名字必须存在")
  should validate_length_of(:middle_name).is_at_most(10).with_message("中间名长度必须小于10")
  should validate_length_of(:last_name).is_at_most(30).with_message("姓长度必须小于30")
  should validate_presence_of(:last_name).with_message("姓必须存在")
  should validate_presence_of(:location).with_message("必须存在有效位置")
  should validate_presence_of(:status).with_message("状态必须设置")
end
