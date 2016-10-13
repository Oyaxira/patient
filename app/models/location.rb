# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  code       :string(10)
#  name       :string(80)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
    validates :name, presence: true
end
