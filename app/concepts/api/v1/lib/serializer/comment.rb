# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class Comment < ApplicationSerializer
    set_type :comment
    attributes :body
    attributes :image do |comment|
      comment.image.url
    end
  end
end
