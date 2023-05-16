class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :avatar, :description

  has_many: books 
end
