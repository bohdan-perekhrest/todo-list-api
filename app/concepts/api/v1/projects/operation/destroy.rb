# frozen_string_literal: true

module Api::V1::Projects::Operation
  class Destroy < ApplicationOperation
    step Model(Project, :find_by, not_found_terminus: true)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
      step Policy::Pundit(Api::V1::Lib::Policy::User, :change?)
    }, fail_fast: true
    step :destroy!
    pass Macro::Semantic(success: :destroyed)

    def destroy!(ctx, model:, **)
      model.destroy
    end
  end
end
