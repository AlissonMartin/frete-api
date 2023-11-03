class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :email_confirm
end
