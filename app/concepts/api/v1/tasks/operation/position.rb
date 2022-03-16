# frozen_string_literal: true

module Api::V1::Tasks::Operation
  class Position < ApplicationOperation
    step Model(Task, :find_by, not_found_terminus: true)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step Policy::Pundit(Api::V1::Lib::Policy::User, :change_task?)
    step :change_position!
    fail Macro::Semantic(failure: :invalid)
    step Macro::Semantic(success: :success)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)

    def change_position!(ctx, model:, params:, **)
      model.position = params['task']['position']
    end
  end
end
