# frozen_string_literal: true

module Api::V1::Comments::Operation
  class Index < ApplicationOperation
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step :index!
    step Macro::Semantic(success: :success)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Comment)

    def index!(ctx, params:, **)
      ctx[:model] = Comment.where(task_id: params[:task_id])
    end
  end
end
