# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  let!(:user) { create(:user, id: 1) }
  describe 'get #show' do
    it 'ユーザーページを表示できる' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

  describe 'get #edit' do
    it '編集画面を表示できる' do
      allow(controller).to receive(:current_user).and_return(user)
      get :edit
      expect(assigns(:user)).to eq(user)
      expect(response.status).to eq(200)
      expect(response).to render_template :settings
    end
  end

  describe 'patch #update' do
    it '更新出来る' do
      allow(controller).to receive(:current_user).and_return(user)
      patch :update, params: { user: { name: 'hastu_38', image: 'icon.png', description: 'My History' } }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(user_path(user))
    end

    it '更新失敗' do
      allow(controller).to receive(:current_user).and_return(user)
      patch :update, params: { user: { name: '', image: 'icon.png', description: 'My History' } }
      expect(response.status).to eq(200)
      expect(response).to render_template :settings
    end
  end

  describe 'delete #destroy' do
    it 'delete the user' do
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(-1)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end
