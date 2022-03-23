# frozen_string_literal: true

module Api::V1::Tasks::Operation
  class Update < ApplicationOperation
    step Model(Task, :find_by, not_found_terminus: true)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
    }, fail_fast: true
    step Contract::Build(name: 'form', constant: Api::V1::Tasks::Contract::Create)
    step Policy::Pundit(Api::V1::Lib::Policy::User, :change_task?)
    step Contract::Validate(name: 'form', key: 'task')
    step Contract::Persist(name: 'form')
    fail Macro::Semantic(failure: :invalid)
    step Macro::Semantic(success: :success)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)
  end
end
