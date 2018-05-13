require 'dry-configurable'
require 'jwt'

class JwtToken
  extend Dry::Configurable
  setting :jwt_private_key, reader: true
  setting :jwt_private_key_pass, reader: true

  def self.token
    payload = {:exp => (Time.now.to_i + 4 * 3600)}
    rsa_private = OpenSSL::PKey::RSA.new config.jwt_private_key, config.jwt_private_key_pass

    token = JWT.encode payload, rsa_private, 'RS256'
  end
end