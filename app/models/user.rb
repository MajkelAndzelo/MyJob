require 'uuidtools'

class User < ApplicationRecord
  before_create :generate_uuid
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address"}
  def name
      nickname.present? ? nickname : email.split('@').first
    end
  def generate_uuid
    self.uuid = UUIDTools::UUID.random_create.to_s
  end
end
