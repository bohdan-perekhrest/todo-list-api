# frozen_string_literal: true

module Constants
  module Shared
    EMAIL_REGEX = /\A(.+)@([a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,63})\z/i.freeze
    PASSWORD_REGEX = /[a-zA-Z0-9]/.freeze
    PASSWORD_MIN_SIZE = 8
    EMAIL_MAX_SIZE = 255
    USERNAME_MIN_SIZE = 3
    USERNAME_MAX_SIZE = 50
    HMAC_SECRET = Rails.application.credentials[:HMAC_SECRET]
    JWT_ALG = 'HS256'
  end
end
