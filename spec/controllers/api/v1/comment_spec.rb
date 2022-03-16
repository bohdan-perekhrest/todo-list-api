RSpec.describe 'V1::Tasks API', api: true, type: :request do
  include ApiDoc::V1::Projects::Api
  let(:user) { User.create({ email: 'some@example.com',
                                username: 'username',
                                password: 'password',
                                password_confirmation: 'password' }) }
  let(:token) { Api::V1::Lib::Service::AuthorizeToken.create(user_id: user.id) }
  let(:valid_headers) { { 'HTTP_ACCESS_TOKEN': token } }
  let(:project) { Project.create!({ title: 'some title', user_id: user.id }) }
  let(:task) { Task.create!({ title: 'some title', user_id: user.id, project_id: project.id }) }

	describe 'GET /api/v1/tasks/:task_id/comments' do
    include ApiDoc::V1::Comments::Index

    before { get "/api/v1/tasks/#{task.id}/comments", headers: valid_headers }

    it 'gets comments', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

	describe 'POST /api/v1/tasks/:task_id/comments' do
    include ApiDoc::V1::Comments::Create
		let(:valid_params) { {'comment': { 'body': 'some body' } } }

    before { post "/api/v1/tasks/#{task.id}/comments", params: valid_params, headers: valid_headers }

    it 'POST comments', :dox do
      expect(response).to have_http_status(:created)
			expect(response.body).to include('some body')
    end
  end

	describe 'DELETE /api/v1/comments/:id' do
    include ApiDoc::V1::Comments::Create
		let(:comment) { Comment.create!(body: 'some body', task_id: task.id, user_id: user.id) }

    before { delete "/api/v1/comments/#{comment.id}", headers: valid_headers }

    it 'POST comments', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end
end
