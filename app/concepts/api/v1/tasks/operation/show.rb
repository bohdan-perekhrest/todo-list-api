# frozen_string_literal: true

module Api::V1::Tasks::Operation
  class Show < ApplicationOperation
    step Model(Task, :find_by, not_found_terminus: true)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step Macro::Semantic(success: :success)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)
  end
end
