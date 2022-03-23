# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApiController
      def index
        endpoint operation: Api::V1::Projects::Operation::Index
      end

      def create
        endpoint operation: Api::V1::Projects::Operation::Create
      end

      def show
        endpoint operation: Api::V1::Projects::Operation::Show
      end

      def update
        endpoint operation: Api::V1::Projects::Operation::Update
      end

      def destroy
        endpoint operation: Api::V1::Projects::Operation::Destroy
      end

      private

      def endpoint_options
        { request: request, params: params }
      end
    end
  end
end
