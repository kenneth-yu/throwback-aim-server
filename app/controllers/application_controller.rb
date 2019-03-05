class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload) #{ user_id: 2 }
    JWT.encode(payload, 'secret') #issue a token, store payload in token
  end

  def auth_header
    request.headers['Authorization'] # Bearer <token>
  end

  def decoded_token
<<<<<<< HEAD
    puts("decoded token")
    if auth_header()
      puts("auth header true")
      puts(auth_header)
      token = auth_header.split('.')[2] #[Bearer, <token>]
      puts("this is what the token is supposed to be:")
      puts(token)
=======
    if auth_header
>>>>>>> 925294d0ea326d5f39f9db0483da67704bc0ba0e
      begin
        JWT.decode(auth_header, 'secret')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
<<<<<<< HEAD
    puts("current user function")
    if decoded_token()
      puts("decoded token true")
      user_id = decoded_token[0]['user_id'] #[{ "user_id"=>"2" }, { "alg"=>"HS256" }]
      @user = User.find_by(id: user_id)
    else
      nil
    end
=======
      if decoded_token
        puts("token decoded")
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
>>>>>>> 925294d0ea326d5f39f9db0483da67704bc0ba0e
  end

  def logged_in?
    puts("at logged in function")
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
