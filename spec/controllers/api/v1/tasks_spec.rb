# frozen_string_literal: true

RSpec.describe Api::V1::TasksController, api: true, type: :controller do
  include ApiDoc::V1::Tasks::Api
  let(:user) { create(:user) }
  before {
    request.headers['HTTP_ACCESS_TOKEN'] = Api::V1::Lib::Service::AuthorizeToken.create(user_id: user.id)
  }
  let(:project) { create(:project, user_id: user.id) }
  let(:task) { create(:task, user_id: user.id, project_id: project.id, position: 1) }
  let(:valid_attributes) { attributes_for(:task) }
  let(:invalid_attributes) { attributes_for(:task, title: 123) }

  describe 'GET #index' do
    include ApiDoc::V1::Tasks::Index

    it 'returns a list of tasks', :dox do
      get :index, params: {project_id: task.project_id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    include ApiDoc::V1::Tasks::Show
    context 'valid params' do
      it 'returns a task', :dox do
        get :show, params: { id: task.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid params' do
      it 'does not find a task', :dox do
        get :show, params: { id: 'invalid_id' }
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST #create' do
    include ApiDoc::V1::Tasks::Create
    context 'with valid params' do
      before { post :create, params: { project_id: task.project_id }, body: jsonapi_body(nil, :task, valid_attributes) }

      it 'returns 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      before { post :create, params: { project_id: task.project_id }, body: jsonapi_body(nil, :task, invalid_attributes) }
      it "doesn't create a new task" do
        expect {response}.to_not change(Task, :count)
      end

      it 'returns bad request entity', :dox do
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'PUT #update' do
    include ApiDoc::V1::Tasks::Update
    context 'with valid params' do
      it 'updates the requested task', :dox do
        put :update, params: { id: task.id }, body: jsonapi_body(task.id, :task, title: 'New task')
        expect(task.reload.title).to eq 'New task'
      end

      it 'returns 200 status' do
        put :update, params: { id: task.id }, body: jsonapi_body(task.id, :task, title: 'New task')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns bad request entity', :dox do
        put :update, params: { id: task.id }, body: jsonapi_body(task.id, :task, invalid_attributes)
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    include ApiDoc::V1::Tasks::Destroy
    it 'deletes the requested task', :dox do
      expect { delete :destroy, params: { id: task.id } }.to change(Task, :count).by(0)
    end

    it 'returns 204 status' do
      delete :destroy, params: { id: task.id }
      expect(response).to have_http_status(204)
    end
  end

  describe 'PUT #complete' do
    include ApiDoc::V1::Tasks::Complete
    it 'complete the requested task', :dox do
      put :complete, params: { id: task.id }
      expect(task.reload.done).to eq true
    end

    it 'returns 200 status' do
      put :complete, params: { id: task.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #position' do
    include ApiDoc::V1::Tasks::Position

    before { create(:task, project_id: task.project_id, position: 2) }

    it 'change position the requested task', :dox do
      put :position, params: { id: task.id }, body: jsonapi_body(task.id, :task, position: 2)
      expect(task.reload.position).to eq 2
    end

    it 'returns 200 status' do
      put :position, params: { id: task.id }, body: jsonapi_body(task.id, :task, position: 2)
      expect(response).to have_http_status(:ok)
    end
  end
end