# frozen_string_literal: true

module Api
  module V1
    module Lib
      module Service
        class AddUserToModel
          def self.call(_ctx, model:, current_user:, **)
            model.user = current_user
          end
        end
      end
    end
  end
end
