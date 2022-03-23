# frozen_string_literal: true

module Api
  module V1
    module Auth
      module Session
        module Operation
          class Destroy < ApplicationOperation
            step :destroy_user_session
            pass Macro::Semantic(success: :destroyed)

            def destroy_user_session(ctx, **)
              ctx.delete(:token)
              true
            end
          end
        end
      end
    end
  end
end
