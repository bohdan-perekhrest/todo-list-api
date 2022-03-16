# frozen_string_literal: true

module Api::V1::Lib::Service::SetPosition
  class << self
    def call(ctx, model:, **)
      max_position = Project.find_by(id: model.project_id).tasks.maximum(:position)
      model.position = max_position.nil? ? 0 : max_position + 1
    end
  end
end
