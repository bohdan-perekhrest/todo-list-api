# frozen_string_literal: true

module Api::V1::Lib::Serializer
  class Task < ApplicationSerializer
    set_type :task
    attributes :title, :done, :due_date, :position
    attribute :comments_count do |task|
      task.comments.count
    end
    has_many :comments, serializer: Api::V1::Lib::Serializer::Comment
  end
end
