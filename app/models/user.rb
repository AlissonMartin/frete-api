class User < ApplicationRecord
  has_one :company
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,  length: {maximum: 50}

  def is_owner?
    self.id == self.company.owner_id
  end


end
