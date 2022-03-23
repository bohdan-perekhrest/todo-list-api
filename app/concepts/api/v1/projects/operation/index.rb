# frozen_string_literal: true

module Api
  module V1
    module Projects
      module Operation
        class Index < ApplicationOperation
          step Rescue(JWT::VerificationError, JWT::DecodeError) {
            step Api::V1::Lib::Service::Authorize
          }, fail_fast: true
          step :index!
          step Macro::Render(serializer: Api::V1::Projects::Serializer::Create)
          pass Macro::Semantic(success: :success)

          def index!(ctx, current_user:, **)
            ctx[:model] = Project.where(user_id: current_user.id)
          end
        end
      end
    end
  end
end
