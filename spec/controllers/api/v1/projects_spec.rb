# frozen_string_literal: true

RSpec.describe Api::V1::ProjectsController, api: true, type: :controller do
  include ApiDoc::V1::Projects::Api
  let(:user) { create(:user) }
  before {
    request.headers['HTTP_ACCESS_TOKEN'] = Api::V1::Lib::Service::AuthorizeToken.create(user_id: user.id)
  }
  let(:project) { create(:project, user_id: user.id) }
  let(:valid_attributes) { attributes_for(:project) }
  let(:invalid_attributes) { attributes_for(:project, title: '') }

  describe 'GET #index' do
    include ApiDoc::V1::Projects::Index

    it 'returns a list of projects', :dox do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    include ApiDoc::V1::Projects::Show
    context 'valid params' do
      it 'returns a project', :dox do
        get :show, params: { id: project.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid params' do
      it 'does not find a project', :dox do
        get :show, params: { id: 'invalid_id' }
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST #create' do
    include ApiDoc::V1::Projects::Create
    context 'with valid params' do
      it 'creates a new project', :dox do
        expect { 
          post :create, body: jsonapi_body(nil, :project, valid_attributes)
        }.to change(Project, :count).by(1)
      end

      it 'returns 201 status' do
        post :create, body: jsonapi_body(nil, :project, valid_attributes)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns bad request entity', :dox do
        post :create,  body: jsonapi_body(nil, :project, invalid_attributes)
        expect(response).to have_http_status(400)
      end

      it "doesn't create a new project" do
        expect { 
          post :create, body: jsonapi_body(nil, :project, invalid_attributes)
        }.to_not change(Project, :count)
      end
    end
  end

  describe 'PUT #update' do
    include ApiDoc::V1::Projects::Update
    context 'with valid params' do
      it 'updates the requested project', :dox do
        put :update, params: { id: project.id }, body: jsonapi_body(project.id, :project, title: 'New project')
        expect(project.reload.title).to eq 'New project'
      end

      it 'returns 200 status' do
        put :update, params: { id: project.id }, body: jsonapi_body(project.id, :project, title: 'New project')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns bad request entity', :dox do
        put :update, params: { id: project.id }, body: jsonapi_body(project.id, :project, title: '')
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    include ApiDoc::V1::Projects::Destroy
    it 'deletes the requested project', :dox do
      expect { delete :destroy, params: { id: project.id } }.to change(Project, :count).by(0)
    end

    it 'returns 204 status' do
      delete :destroy, params: { id: project.id }
      expect(response).to have_http_status(204)
    end
  end
end
