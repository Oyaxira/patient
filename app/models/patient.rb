# == Schema Information
#
# Table name: patients
#
#  id            :integer          not null, primary key
#  first_name    :string(30)       not null
#  middle_name   :string(10)
#  last_name     :string(30)       not null
#  birth         :datetime
#  gender        :integer
#  status        :integer          default({:initial=>0, :referred=>1, :treatment=>2, :closed=>3}), not null
#  location_id   :integer          not null
#  viewed_count  :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  delete_status :boolean          default(FALSE)
#
# Indexes
#
#  index_patients_on_location_id  (location_id)
#

class Patient < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :middle_name, length: { maximum: 10 }
  validates :location_id, presence: true
  validates :status, presence: true
  enum status: {initial: 0, referred: 1, treatment: 2, closed: 3}
  enum gender: [:not_available, :male, :female]
  default_scope { where(delete_status: false) }
  belongs_to :location

  def destroy
    self.update_column(:delete_status, true)
  end

end
