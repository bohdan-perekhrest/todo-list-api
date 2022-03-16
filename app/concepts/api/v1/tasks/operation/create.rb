# frozen_string_literal: true

module Api::V1::Tasks::Operation
  class Create < ApplicationOperation
    step Model(Task, :new)
    step :add_project!
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
      step Api::V1::Lib::Service::AddUserToModel
    }, fail_fast: true
    step Policy::Pundit(Api::V1::Lib::Policy::User, :change_task?)
    step Api::V1::Lib::Service::SetPosition
    step Contract::Build(name: 'form', constant: Api::V1::Tasks::Contract::Create)
    step Contract::Validate(name: 'form', key: 'task')
    step Contract::Persist(name: 'form')
    fail Macro::Semantic(failure: :invalid)
    step Macro::Semantic(success: :created)
    pass Macro::Render(serializer: Api::V1::Lib::Serializer::Task)

    def add_project!(ctx, model:, params:, **)
      model.project_id = params[:project_id]
    end
  end
end
