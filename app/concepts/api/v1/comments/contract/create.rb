# frozen_string_literal: true

module Api
  module V1
    module Comments
      module Contract
        class Create < ApplicationContract
          property :body

          validation name: :default do
            params do
              required(:body).filled(:str?)
            end
          end
        end
      end
    end
  end
end
