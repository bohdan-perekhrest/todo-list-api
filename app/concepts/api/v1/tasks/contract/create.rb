# frozen_string_literal: true

module Api
  module V1
    module Tasks
      module Contract
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
    end
  end
end
