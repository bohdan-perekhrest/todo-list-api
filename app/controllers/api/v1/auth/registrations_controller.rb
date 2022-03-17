# frozen_string_literal: true

module Api
  module V1
    module Auth
      class RegistrationsController < ApiController
        def create
          endpoint operation: Api::V1::Auth::Registration::Operation::Create
        end
      end
    end
  end
end
