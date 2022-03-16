# frozen_string_literal: true

module Api::V1::Projects::Operation
  class Show < ApplicationOperation
    step Rescue(JWT::VerificationError, JWT::DecodeError){
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step Model(Project, :find_by, not_found_terminus: true)
    step Macro::Semantic(success: :success)
    pass Macro::Render(serializer: Api::V1::Projects::Serializer::Create)
  end
end
