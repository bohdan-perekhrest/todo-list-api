# frozen_string_literal: true

module Api::V1::Lib::Service::ChangePosition
  class << self
    def call(ctx, **)
      project = Project.find_by(id: ctx[:model].project_id)
      project.tasks.find_by(id: ctx[:model].id).insert_at(ctx[:params]['task']['position'].to_i)
    end
  end
end
