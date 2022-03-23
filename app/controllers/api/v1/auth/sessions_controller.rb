# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < ApiController
        def create
          endpoint operation: Api::V1::Auth::Session::Operation::Create
        end

        def destroy
          endpoint operation: Api::V1::Auth::Session::Operation::Destroy
        end
      end
    end
  end
end
