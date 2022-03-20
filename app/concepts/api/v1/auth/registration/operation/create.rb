# frozen_string_literal: true

module Api::V1::Auth::Registration::Operation
  class Create < ApplicationOperation
    step Model(User, :new)
    step Contract::Build(constant: Api::V1::Auth::Registration::Contract::Create, name: 'form')
    step Contract::Validate(name: 'form', key: 'user')
    step Contract::Persist(name: 'form')
    fail Macro::Semantic(failure: :invalid)
    step :set_session_token
    step Macro::Render(serializer: Api::V1::Lib::Serializer::User)
    pass Macro::Semantic(success: :created)

    def set_session_token(ctx, model:, **)
      ctx[:token] = Api::V1::Lib::Service::AuthorizeToken.create(user_id: model.id)
    end
  end
end
