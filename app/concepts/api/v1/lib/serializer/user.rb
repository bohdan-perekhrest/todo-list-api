# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class User < ApplicationSerializer
    set_type :user
    attributes :username, :email
  end
end
