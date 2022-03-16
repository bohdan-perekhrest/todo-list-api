# frozen_string_literal: true

module Macro
  def self.Semantic(success: nil, failure: nil, **)
    task = Trailblazer::Activity::TaskBuilder::Binary(
      ->(ctx, **) {
        ctx[:semantic_success], ctx[:semantic_failure] = success, failure
        true
      }
    )
    {task: task}
  end
end
