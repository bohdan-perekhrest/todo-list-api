# frozen_string_literal: true

module Api::V1::Comments::Operation
  class Create < ApplicationOperation
    step Model(Comment, :new)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
      step Api::V1::Lib::Service::AddUserToModel
    }, fail_fast: true
    step :add_task!
    step Contract::Build(name: 'form', constant: Api::V1::Comments::Contract::Create)
    step Contract::Validate(name: 'form', key: 'comment')
    step Contract::Persist(name: 'form')
    fail Macro::Semantic(failure: :invalid)
    step Macro::Semantic(success: :created)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Comment)

    def add_task!(_ctx, model:, params:, **)
      model.task_id = params[:task_id]
    end
  end
end
