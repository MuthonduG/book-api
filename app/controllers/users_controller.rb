class UsersController < ApplicationController
  
rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
rescue_from ActiveRecord::RecordInvalid, with: :user_unprocessable_entity

    def index
        user = User.all
        render json: user, status: :ok
    end

    def show
        user = find_user
    end

    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    def update
        user = User.update!(user_params)
        render json: user, status: :created
    end

    def destroy
        user = find_user
        user.destroy
        head: no_content
    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :email, :description, :avatar, :password, :admin)
    end

    def user_not_found
        render json: { error: 'User not found'}, status: :not_found
    end

    def user_unprocessable_entity(invalid)
        render json: { error: invalid.record.errors.full_messages }, status: :uprocessable_entity
    end

end
