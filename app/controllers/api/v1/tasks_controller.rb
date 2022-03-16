# frozen_string_literal: true

module Api::V1
  class TasksController < ApiController

    def index
      endpoint operation: Api::V1::Tasks::Operation::Index
    end

    def create
      endpoint operation: Api::V1::Tasks::Operation::Create
    end

    def show
      endpoint operation: Api::V1::Tasks::Operation::Show
    end

    def update
      endpoint operation: Api::V1::Tasks::Operation::Update
    end

    def destroy
      endpoint operation: Api::V1::Tasks::Operation::Destroy
    end

    def complete
      endpoint operation: Api::V1::Tasks::Operation::Complete
    end

    def position
      endpoint operation: Api::V1::Tasks::Operation::Position
    end

    private

    def endpoint_options
      { request: request, params: params }
    end
  end
end
