# frozen_string_literal: true

module Api
  module V1
    module Tasks
      module Operation
        class Show < ApplicationOperation
          step Model(Task, :find_by, not_found_terminus: true)
          step Rescue(JWT::VerificationError, JWT::DecodeError) {
            step Api::V1::Lib::Service::Authorize
          }
          step Macro::Semantic(success: :success)
          pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)
        end
      end
    end
  end
end
