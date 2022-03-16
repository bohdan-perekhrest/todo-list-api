# frozen_string_literal: true

module Api::V1::Auth::Session::Operation
  class Destroy < ApplicationOperation
    step :destroy_user_session 
    pass Macro::Semantic(success: :destroyed)

    def destroy_user_session(ctx, **)
      ctx.delete(:token)
      true
    end
  end
end
