# frozen_string_literal: true

module ApiDoc
  module V1
    module Comments
      extend Dox::DSL::Syntax

      document :api do
        resource 'Comments' do
          endpoint '/comments'
          group 'Comments'
        end
      end

      document :index do
        action 'Get comments'
      end

      document :create do
        action 'Create comment'
      end

      document :destroy do
        action 'Destroy comment'
      end
    end
	end
end
