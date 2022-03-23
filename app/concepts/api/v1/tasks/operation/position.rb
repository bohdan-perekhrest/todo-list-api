# frozen_string_literal: true

module Api
  module V1
    module Tasks
      module Operation
        class Position < ApplicationOperation
          step Model(Task, :find_by, not_found_terminus: true)
          step Rescue(JWT::VerificationError, JWT::DecodeError) {
            step Api::V1::Lib::Service::Authorize
          }, fail_fast: true
          step Policy::Pundit(Api::V1::Lib::Policy::User, :change_task?)
          step Api::V1::Lib::Service::ChangePosition
          fail Macro::Semantic(failure: :invalid)
          step Macro::Semantic(success: :success)
          pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)
        end
      end
    end
  end
end
