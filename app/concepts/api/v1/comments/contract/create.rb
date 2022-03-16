# frozen_string_literal: true

module Api::V1::Comments::Contract
  class Create < ApplicationContract
    property :body

    validation name: :default do
      params do
        required(:body).filled(:str?)
      end
    end
  end
end
