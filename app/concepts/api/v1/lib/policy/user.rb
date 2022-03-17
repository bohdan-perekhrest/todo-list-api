# frozen_string_literal: true

module Api
  module V1
    module Lib
      module Policy
        class User
          def initialize(user, model, **_arg)
            @model = model
            @user = user
          end

          def change?
            model.user.id == user.id
          end

          def change_task?
            user.id == model.project.user_id
          end

          private

          attr_reader :model, :user
        end
      end
    end
  end
end
