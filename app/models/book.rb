class Book < ApplicationRecord
    validates: title, presence: true
    validates: description, presence: true
    validates: poster, presence: true
    validates: description, presence: true
    validates: price, presence: true, numericality: true

    has_many :favourites
    has_many :users, through: :favourites
end
