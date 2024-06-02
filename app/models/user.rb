class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  private

  def generate_token_id
    self.token_id = SecureRandom.hex(10)
  end

end
