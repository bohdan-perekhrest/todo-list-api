# frozen_string_literal: true

module Api
  module V1
    module Tasks
      module Operation
        class Complete < ApplicationOperation
          step Model(Task, :find_by, not_found_terminus: true)
          step Rescue(JWT::VerificationError, JWT::DecodeError) {
            step Api::V1::Lib::Service::Authorize
          }, fail_fast: true
          step Policy::Pundit(Api::V1::Lib::Policy::User, :change_task?)
          step :complete!
          step Macro::Semantic(success: :success)
          pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)

          def complete!(_ctx, model:, **)
            model.done = true
            model.save
          end
        end
      end
    end
  end
end
