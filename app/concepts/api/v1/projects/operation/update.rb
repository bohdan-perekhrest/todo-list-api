# frozen_string_literal: true

module Api::V1::Projects::Operation
  class Update < ApplicationOperation
    step Model(Project, :find_by, not_found_terminus: true)
    step Rescue(JWT::VerificationError, JWT::DecodeError) {
      step Api::V1::Lib::Service::Authorize
      step Policy::Pundit(Api::V1::Lib::Policy::User, :change?)
    }, fail_fast: true
    step Contract::Build(name: 'form', constant: Api::V1::Projects::Contract::Create)
    step Contract::Validate(name: 'form', key: 'project')
    step Contract::Persist(name: 'form')
    fail Macro::Semantic(failure: :invalid)
    step Macro::Semantic(success: :created)
    pass Macro::Render(serializer: Api::V1::Projects::Serializer::Create)
  end
end

