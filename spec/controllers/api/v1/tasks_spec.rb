# frozen_string_literal: true

RSpec.describe 'V1::Tasks API', api: true, type: :request do
  include ApiDoc::V1::Projects::Api
  let(:user) { User.create({ email: 'some@example.com',
                              username: 'username',
                              password: 'password',
                              password_confirmation: 'password' }) }
  let(:token) { Api::V1::Lib::Service::AuthorizeToken.create(user_id: user.id) }
  let(:valid_headers) { { 'HTTP_ACCESS_TOKEN': token } }
  let(:project) { Project.create!({ title: 'some title', user_id: user.id }) }

  describe 'GET /api/v1/projects/:project_id/tasks' do
    include ApiDoc::V1::Tasks::Index

    before { get "/api/v1/projects/#{project.id}/tasks", params: {}, headers: valid_headers }

    it 'gets tasks', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/v1/projects/:project_id/tasks' do
    include ApiDoc::V1::Tasks::Create

    let(:valid_params) { { 'task': { 'title': 'some title' } } }

    before { post "/api/v1/projects/#{project.id}/tasks", params: valid_params, headers: valid_headers }

    it 'creates task', :dox do
      expect(response).to have_http_status(:created)
      expect(response.body).to include('some title')
    end
  end

  describe 'Patch/Put /api/v1/tasks/:id' do
    include ApiDoc::V1::Tasks::Create

    let(:task) { Task.create!({ title: 'some title', user_id: user.id, project_id: project.id }) }
    let(:valid_params) { { 'task': { 'title': 'changed title' } } }

    before { patch "/api/v1/tasks/#{task.id}", params: valid_params, headers: valid_headers }

    it 'updates task', :dox do
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('changed title')
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    include ApiDoc::V1::Tasks::Show
		let(:task) { Task.create!({ title: 'some title', user_id: user.id, project_id: project.id }) }

		before { get "/api/v1/tasks/#{task.id}", headers: valid_headers }

    it 'updates task', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /api/v1/tasks/:id ' do
    include ApiDoc::V1::Tasks::Destroy

    let(:task) { Task.create!({ title: 'some title', user_id: user.id, project_id: project.id }) }

    before { delete "/api/v1/tasks/#{task.id}", headers: valid_headers }

    it 'delete task', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end

	describe 'PATCH /api/v1/tasks/:id/complete' do
		include ApiDoc::V1::Tasks::Complete
		let(:task) { Task.create!({ title: 'some title', user_id: user.id, project_id: project.id }) }
		before { patch "/api/v1/tasks/#{task.id}/complete", headers: valid_headers }

    it 'updates status of task', :dox do
      expect(response).to have_http_status(:ok)
			expect(response.body).to include("#{!task.done}")
    end
	end

	describe 'PATCH /api/v1/tasks/:id/complete' do
		include ApiDoc::V1::Tasks::Position
		let(:task) { Task.create!({ title: 'some title', user_id: user.id, project_id: project.id }) }
		let(:valid_params) { { 'task': { 'position': 2 } } }
		before { patch "/api/v1/tasks/#{task.id}/position", params: valid_params, headers: valid_headers }

    it 'updates position of task', :dox do
      expect(response).to have_http_status(:ok)
			expect(response.body).to include("#{task.position}")
    end
	end
end
