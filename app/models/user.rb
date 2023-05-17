class User < ApplicationRecord
    has_secure_password

    validates: name, presence: true
    validates: username, presence: true
    validates: email, uniqueness: true
    validates: password, presence: true, length: { minimum: 8 }

    has_many :favourites
    has_many :books, through: :favourites
end
