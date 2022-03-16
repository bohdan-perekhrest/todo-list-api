# frozen_string_literal: true

module Api::V1::Tasks::Contract
  class Create < ApplicationContract
    property :title
    property :due_date

    validation name: :default do
      params do
        required(:title).filled(:str?)
      end
    end
  end
end
