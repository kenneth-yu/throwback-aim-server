class ApplicationController < ActionController::API
    before_action :authorized
    
    def encode_token(payload)
      JWT.encode(payload, 'secret')
    end

    def auth_header
      request.headers['Authorization']
    end

    def decoded_token
      if auth_header
        begin
          JWT.decode(auth_header, 'secret')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end

    def logged_in?
      !!current_user
    end
end
