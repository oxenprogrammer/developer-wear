class AuthenticationTokenService
  HMAC_SECRET = ENV['HMAC_SECRET']
  # ALGORITHM_TYPE = ENV['ALGORITHM_TYPE']

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    decoded = JWT.decode(token, HMAC_SECRET).first
    HashWithIndifferentAccess.new decoded
  end
end
