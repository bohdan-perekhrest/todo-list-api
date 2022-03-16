# frozen_string_literal: true

RSpec.describe 'V1::Projects API', api: true, type: :request do
  include ApiDoc::V1::Projects::Api
  let(:user) { User.create({ email: 'some@example.com',
                            username: 'username',
                            password: 'password',
                            password_confirmation: 'password' }) }
  let(:token) { Api::V1::Lib::Service::AuthorizeToken.create(user_id: user.id) }
  let(:valid_headers) { { 'HTTP_ACCESS_TOKEN': token } }

  describe 'GET /api/v1/projects' do
    include ApiDoc::V1::Projects::Index

    before { get '/api/v1/projects', params: {}, headers: valid_headers }

    it 'gets projects', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/v1/projects' do
    include ApiDoc::V1::Projects::Create

    let(:valid_params) { { 'project': { 'title': 'some title' } } }

    before { post '/api/v1/projects', params: valid_params, headers: valid_headers }

    it 'creates project', :dox do
      expect(response).to have_http_status(:created)
      expect(response.body).to include('some title')
    end
  end

  describe 'Patch/Put /api/v1/projects/:id' do
    include ApiDoc::V1::Projects::Create

    let(:project) { Project.create!({ title: 'some title', user_id: user.id }) }
    let(:valid_params) { { 'project': { 'title': 'changed title' } } }

    before { patch "/api/v1/projects/#{project.id}", params: valid_params, headers: valid_headers }

    it 'updates project', :dox do
      expect(response).to have_http_status(:created)
      expect(response.body).to include('changed title')
    end
  end

  describe 'GET /api/v1/projects/:id' do
    include ApiDoc::V1::Projects::Show

    let(:project) { Project.create!({ title: 'some title', user_id: user.id }) }

    before { get "/api/v1/projects/#{project.id}", headers: valid_headers }

    it 'updates project', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /api/v1/projects/:id ' do
    include ApiDoc::V1::Projects::Destroy

    let(:project) { Project.create!({ title: 'some title', user_id: user.id }) }

    before { delete "/api/v1/projects/#{project.id}", headers: valid_headers }

    it 'delete project', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end
end
