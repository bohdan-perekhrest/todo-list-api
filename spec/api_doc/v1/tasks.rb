# frozen_string_literal: true

module ApiDoc
	module V1
  	module Tasks
    	extend Dox::DSL::Syntax
  
      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end
      end
  
      document :index do
        action 'Get tasks'
      end
  
      document :create do
        action 'Create task'
      end
  
      document :show do
        action 'Show task'
      end
  
      document :update do
        action 'Update task'
      end
  
      document :destroy do
        action 'Destroy task'
      end

      document :complete do
        action 'Complete task'
      end

      document :position do
        action 'Position task'
      end
    end
  end
end
