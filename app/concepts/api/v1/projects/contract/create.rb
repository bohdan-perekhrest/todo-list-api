# frozen_string_literal: true

module Api
  module V1
    module Projects
      module Contract
        class Create < ApplicationContract
          property :title

          validation do
            params do
              required(:title).filled(:str?)
            end

            rule(:title) do
              key.failure('The project with such name does already exist.') if Project.exists?(title: values[:title])
            end
          end
        end
      end
    end
  end
end
