# frozen_string_literal: true

module Api::V1::Lib::Policy
  class User

    def initialize(user, model, **arg)
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
