class JsonWebToken
  JWT_SECRETY_KEY = Rails.application.secrets.secret_key_base.to_s
  
  def self.encode(payload, exp=24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRETY_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, JWT_SECRETY_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end