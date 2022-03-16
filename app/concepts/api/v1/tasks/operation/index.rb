# frozen_string_literal: true

module Api::V1::Tasks::Operation
  class Index < ApplicationOperation
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step :index!
    step Macro::Semantic(success: :success)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)

    def index!(ctx, params:, **)
      ctx[:model] = Task.where(project_id: params[:project_id])
    end
  end
end
