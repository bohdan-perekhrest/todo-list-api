# frozen_string_literal: true

module Api::V1::Lib::Service::AuthorizeToken
  class << self
    def create(user_id:)
      payload = {
        user_id: user_id,
        exp: 24.hours.from_now.to_i
      }
      JWT.encode payload, Constants::Shared::HMAC_SECRET, Constants::Shared::JWT_ALG
    end

    def decode(token)
      JWT.decode token, Constants::Shared::HMAC_SECRET, true, { verify_expiration: false, algorithm: Constants::Shared::JWT_ALG }
    end

    def destroy(token:)
      JWT.decode token, Constants::Shared::HMAC_SECRET, true, { algorithm: Constants::Shared::JWT_ALG }
    end
  end
end
