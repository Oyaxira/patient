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

FactoryGirl.define do
  factory :patient do
    
  end
end
