# frozen_string_literal: true

module Api::V1::Auth::Session::Operation
  class Create < ApplicationOperation
    step Model(User, :find_by, :email)
    fail Macro::Semantic(failure: :bad_request)
    step :authenticate
    fail Macro::Semantic(failure: :unauthorized)
    step :set_session_token
    step Macro::Semantic(success: :created)
    step Macro::Render(serializer: Api::V1::Lib::Serializer::User)

    def authenticate(ctx, model:, **)
      model.valid_password?(ctx[:params][:password])
    end

    def set_session_token(ctx, model:, **)
      ctx[:token] = Api::V1::Lib::Service::AuthorizeToken.create(user_id: model.id)
    end
  end
end
