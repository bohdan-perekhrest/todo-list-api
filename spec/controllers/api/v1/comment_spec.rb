# frozen_string_literal: true

RSpec.describe Api::V1::CommentsController, api: true, type: :controller do
  include ApiDoc::V1::Comments::Api
  let(:user) { create(:user) }
  before {
    request.headers['HTTP_ACCESS_TOKEN'] = Api::V1::Lib::Service::AuthorizeToken.create(user_id: user.id)
  }
  let(:comment) { create(:comment, user_id: user.id) }
  let(:valid_attributes) { attributes_for(:comment) }
  let(:invalid_attributes) { attributes_for(:comment, body: '') }

  describe 'GET #index' do
    include ApiDoc::V1::Comments::Index

    it 'returns a list of comments', :dox do
      get :index, params: { task_id: comment.task_id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    include ApiDoc::V1::Comments::Create
    context 'with valid params' do
      it 'returns 201 status' do
        post :create, params: { task_id: comment.task_id }, body: jsonapi_body(nil, :comment, valid_attributes)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns bad request entity', :dox do
        post :create, params: { task_id: comment.task_id }, body: jsonapi_body(nil, :comment, invalid_attributes)
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    include ApiDoc::V1::Comments::Destroy
    it 'deletes the requested comment', :dox do
      expect { delete :destroy, params: { id: comment.id } }.to change(Comment, :count).by(0)
    end

    it 'returns 204 status' do
      delete :destroy, params: { id: comment.id }
      expect(response).to have_http_status(204)
    end
  end
end