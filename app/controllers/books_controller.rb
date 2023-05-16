class BooksController < ApplicationController
    
rescue_from ActiveRecord::RecordNotFound, with: :book_not_found
rescue_from ActiveRecord::RecordInvalid, with: :book_unprocessable_entity

    def index
        book = Book.all
        render json: book, status: :ok
    end

    def show
        book = find_book
    end

    def create
        book = Book.create!(book_params)
        render json: book, status: :created
    end

    def update
        book = Book.update!(book_params)
        render json: book, status: :created
    end

    def destroy
        book = find_book
        book.destroy
        head: no_content
    end

    private

    def find_book
        Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:name, :bookname, :email, :description, :avatar, :password, :admin)
    end

    def book_not_found
        render json: { error: 'book not found'}, status: :not_found
    end

    def book_unprocessable_entity(invalid)
        render json: { error: invalid.record.errors.full_messages }, status: :uprocessable_entity
    end

end
