# frozen_string_literal: true

module Api
  module V1
    module Auth
      module Registration
        module Operation
          class Create < ApplicationOperation
            step Model(User, :new)
            step Contract::Build(constant: Api::V1::Auth::Registration::Contract::Create, name: 'registration')
            step Contract::Validate(name: 'registration')
            step Contract::Persist(name: 'registration')
            fail Macro::Semantic(failure: :bad_request)
            step :set_session_token
            step Macro::Render(serializer: Api::V1::Lib::Serializer::User)
            pass Macro::Semantic(success: :created)

            def set_session_token(ctx, model:, **)
              ctx[:token] = Api::V1::Lib::Service::AuthorizeToken.create(user_id: model.id)
            end
          end
        end
      end
    end
  end
end
