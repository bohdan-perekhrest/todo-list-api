# frozen_string_literal: true

module Api
  module V1
    module Comments
      module Operation
        class Destroy < ApplicationOperation
          step Model(Comment, :find_by, not_found_terminus: true)
          step Rescue(JWT::VerificationError, JWT::DecodeError) {
            step Api::V1::Lib::Service::Authorize
          }, fail_fast: true
          step :destroy!
          pass Macro::Semantic(success: :destroyed)

          def destroy!(_ctx, model:, **)
            model.destroy
          end
        end
      end
    end
  end
end
