# frozen_string_literal: true

module Api::V1::Auth::Registration::Contract
  class Create < ApplicationContract
    property :username
    property :email
    property :password
    property :password_confirmation, virtual: true

    validation name: :default do
      params do
        required(:username).filled(
          :str?,
          max_size?: Constants::Shared::USERNAME_MAX_SIZE,
          min_size?: Constants::Shared::USERNAME_MIN_SIZE
        )
        required(:email).filled(
          :str?,
          max_size?: Constants::Shared::EMAIL_MAX_SIZE,
          format?: Constants::Shared::EMAIL_REGEX
        )
        required(:password).filled(
          :str?,
          min_size?: Constants::Shared::PASSWORD_MIN_SIZE,
          format?: Constants::Shared::PASSWORD_REGEX
        )
        required(:password_confirmation).filled(:str?)
      end

      rule(:password, :password_confirmation) do
        if values[:password] == values[:password_confiramtion]
          key.failure('password does not match password confirmation.')
        end
      end

      rule(:email) do
        if User.exists?(email: values[:email])
          key.failure('this email already taken')
        end
      end

      rule(:username) do
        if User.exists?(username: values[:username])
          key.failure('this username already taken')
        end
      end
    end
  end
end
