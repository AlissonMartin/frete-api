class Company < ApplicationRecord
  has_many :employees, class_name: "User", foreign_key: "company_id"
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
end
