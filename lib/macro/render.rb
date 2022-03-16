# frozen_string_literal: true

module Macro
  def self.Render(serializer: ApplicationSerializer, **)
    task = Trailblazer::Activity::TaskBuilder::Binary(
      ->(ctx, **) {
        ctx[:render] = {
          serializer: serializer
        }
      }
    )
    {task: task}
  end
end

