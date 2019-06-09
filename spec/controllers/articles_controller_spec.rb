# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController, type: :controller do
  let!(:article) { create(:article) }
  describe 'GET index' do
    it 'works' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'get #show' do
    it 'work' do
      get :show, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end
end
