class User < ApplicationRecord
  belongs_to :company, optional: true
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,  length: {maximum: 50}

  def is_owner?
    self.id == self.company.owner_id
  end


end
