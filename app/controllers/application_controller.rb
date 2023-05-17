class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user

    def authenticate_user
        header = request.headers['Authorization']
        token = header.split(' ').last if header
        if token
            begin
                decode_token = JWT.decode(token, Rails.application.secret_key_base)

                if decode_token[0]['exp'] < Time.now.to_int
                    render json: { error: 'Token has expired'}, status: :unauthorized
                else
                    user_role = decode_token[0]['role']
                    user_ref = decode_token[0]['user_ref']
                    @current_user = User.find_by(user_id: user_reference)

                    unless @current_user
                        render json: { error: 'Unauthorized'}, status: :unauthorized
                    end
                end
            rescue JWT::DecodeError
                render json: { error: 'Invalid token'}, status: :unauthorized
            end
        else
            render json: {'Token not provided'}, status: :unauthorized
        end
    end
end
