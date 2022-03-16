# frozen_string_literal: true

module Api::V1::Tasks::Operation
  class Destroy < ApplicationOperation
    step Model(Task, :find_by, not_found_terminus: true)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step Policy::Pundit(Api::V1::Lib::Policy::User, :change_task?)
    step :destroy!
    pass Macro::Semantic(success: :destroyed)

    def destroy!(ctx, model:, **)
      model.destroy!
    end
  end
end
