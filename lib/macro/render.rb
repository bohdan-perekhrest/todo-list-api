# frozen_string_literal: true

module Macro
  def self.Render(serializer: ApplicationSerializer, **)
    task = Trailblazer::Activity::TaskBuilder::Binary(
      lambda { |ctx, **|
        ctx[:render] = {
          serializer: serializer
        }
      }
    )
    { task: task }
  end
end
