# frozen_string_literal: true

module Api::V1::Lib::Service
  class AddUserToModel
    def self.call(ctx, model:, current_user:, **)
      model.user = current_user
    end
  end
end
