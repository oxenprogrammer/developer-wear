module Authenticable
  include ActionController::HttpAuthentication::Token
  def current_user
    return @current_user if @current_user

    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    @current_user = begin
      User.find(user_id)
    rescue StandardError
      ActiveRecord::RecordNotFound
    end
  end
end
