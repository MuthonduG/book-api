class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :poster, :description, :price, :genre
  
  has_many: users
end
