# frozen_string_literal: true

module Api::V1
  class CommentsController < ApiController
    def index
      endpoint operation: Api::V1::Comments::Operation::Index
    end

    def create
      endpoint operation: Api::V1::Comments::Operation::Create
    end

    def destroy
      endpoint operation: Api::V1::Comments::Operation::Destroy
    end

    private

    def endpoint_options
      { request: request, params: params }
    end
  end
end
