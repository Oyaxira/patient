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
#  status        :integer          not null
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
  validates :first_name, presence: {  message: "#{I18n.t('first_name', scope: [:errors])}"} , length: { maximum: 30, message: "#{I18n.t('first_name_length', scope: [:errors])}" }
  validates :last_name, presence: {  message: "#{I18n.t('last_name', scope: [:errors])}"} , length: { maximum: 30 , message: "#{I18n.t('last_name_length', scope: [:errors])}"}
  validates :middle_name, length: { maximum: 10, message: "#{I18n.t('middle_name', scope: [:errors])}" }
  validates :status, presence: {  message: "#{I18n.t('status', scope: [:errors])}"}
  enum status: {initial: 0, referred: 1, treatment: 2, closed: 3}
  enum gender: [:not_available, :male, :female]
  default_scope { where(delete_status: false) }
  belongs_to :location
  validates :location, presence: { message: "#{I18n.t('location', scope: [:errors])}"}
  scope :on_treatment,  ->{ where(status: 2) }
  def destroy
    self.update_column(:delete_status, true)
  end

end
