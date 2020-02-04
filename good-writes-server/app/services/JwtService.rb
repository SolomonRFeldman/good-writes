class JwtService
  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials[:secret_key_base], 'HS256')
  end

  def self.decode(token)
    if(token)
      body, = JWT.decode(token, Rails.application.credentials[:secret_key_base], true, algorithm: 'HS256')
      HashWithIndifferentAccess.new(body)
    else
      { user_id: nil}
    end
  rescue JWT::ExpiredSignature
    nil
  end
end