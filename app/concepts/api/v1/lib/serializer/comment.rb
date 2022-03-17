# frozen_string_literal: true

module Api
  module V1
    module Lib
      module Serializer
        class Comment < ApplicationSerializer
          set_type :comment
          attributes :body
          attributes :image do |comment|
            comment.image.url
          end
        end
      end
    end
  end
end
