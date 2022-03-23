# frozen_string_literal: true

module Api
  module V1
    module Lib
      module Serializer
        class User < ApplicationSerializer
          set_type :user
          attributes :username, :email
        end
      end
    end
  end
end
