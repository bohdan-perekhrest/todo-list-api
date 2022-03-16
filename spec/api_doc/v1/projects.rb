# frozen_string_literal: true

module ApiDoc
  module V1
    module Projects
      extend Dox::DSL::Syntax

      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end
      end

      document :index do
        action 'Get projects'
      end

      document :create do
        action 'Create project' do
          verb 'POST'
          request_schema 'namespace/projects'
          response_schema_success 'namespace/projects_s'
          response_schema_fail 'namespace/projects_f'
        end
      end

      document :show do
        action 'Show project'
      end

      document :update do
        action 'Update project'
      end

      document :destroy do
        action 'Destroy project'
      end
    end
  end
end
