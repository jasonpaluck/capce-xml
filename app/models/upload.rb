class Upload < ApplicationRecord
  belongs_to :user
  validates :user_id, :upload_url, presence: true
  paginates_per 10
end
