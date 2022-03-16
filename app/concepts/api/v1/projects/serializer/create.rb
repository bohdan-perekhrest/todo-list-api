# frozen_string_literal: true

module Api::V1::Projects::Serializer
  class Create < ApplicationSerializer
    set_type :project
    attributes :title
    belongs_to :user, serializer: Api::V1::Lib::Serializer::User
    has_many :tasks, serializer: Api::V1::Lib::Serializer::Task
  end
end

