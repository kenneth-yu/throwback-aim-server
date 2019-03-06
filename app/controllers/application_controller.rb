class ApplicationController < ActionController::API
    before_action :authorized
    
    def encode_token(payload)
      JWT.encode(payload, 'secret')
    end

    def auth_header
      request.headers['Authorization']
    end

<<<<<<< HEAD
  def decoded_token
    if auth_header()
      token = auth_header.split('.')[2] #[Bearer, <token>]
      begin
        JWT.decode(auth_header, 'secret')
      rescue JWT::DecodeError
        nil
=======
    def decoded_token
      if auth_header
        begin
          JWT.decode(auth_header, 'secret')
        rescue JWT::DecodeError
          nil
        end
>>>>>>> 828ab128f337ad48b6354507f2ed00bad7b42eb2
      end
    end

<<<<<<< HEAD
  def current_user
    if decoded_token()
      user_id = decoded_token[0]['user_id'] #[{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      @user = User.find_by(id: user_id)
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end
=======
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
>>>>>>> 828ab128f337ad48b6354507f2ed00bad7b42eb2

    def logged_in?
      !!current_user
    end
end
