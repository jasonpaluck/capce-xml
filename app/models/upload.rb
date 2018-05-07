class Upload < ApplicationRecord
  belongs_to :user
  validates :user_id, :upload_url, presence: true
  paginates_per 10
  EXCEL_COLUMNS = ["nameLast", "nameFirst", "nameMiddle", "Street", "City", "State", "Zip", "emailAddress", "dateOfCompletion", "Phone", "courseNo", "Units", "Provider", "licenseNo", "stateIssued", "licenseType", "expiration", "nremtNo", "nremtReReg", "Type"].freeze
end
