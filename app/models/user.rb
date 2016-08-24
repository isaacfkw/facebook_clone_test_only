class User < ActiveRecord::Base
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy

	validates :name, :email, :password, :password_confirmation, presence: true
	validates :email, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, length: { in: 6..20 }
	validates :password, confirmation: true
	has_secure_password

end
