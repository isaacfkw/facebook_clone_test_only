class Status < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :title, :content, presence: true
  validates :title, length: { minimum: 8, message: "title is too short" }
  validates :content, length: { minimum: 10, message: "content is too short" }

  default_scope { order('created_at DESC') }
end
