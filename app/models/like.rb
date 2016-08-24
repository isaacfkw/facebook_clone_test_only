class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :status

  validates :user_id, :status_id, presence: true
end
