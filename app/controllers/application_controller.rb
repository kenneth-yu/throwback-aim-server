class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload) #{ user_id: 2 }
    JWT.encode(payload, 'my_s3cr3t') #issue a token, store payload in token
  end

  def auth_header
    request.headers['Authorization'] # Bearer <token>
  end

  def decoded_token
    puts("decoded token")
    if auth_header()
      puts("auth header true")
      puts(auth_header)
      token = auth_header.split('.')[2] #[Bearer, <token>]
      puts("this is what the token is supposed to be:")
      puts(token)
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        # JWT.decode => [{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    puts("current user function")
    if decoded_token()
      puts("decoded token true")
      user_id = decoded_token[0]['user_id'] #[{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      @user = User.find_by(id: user_id)
    else
      nil
    end
  end

  def logged_in?
    puts("at logged in function")
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
