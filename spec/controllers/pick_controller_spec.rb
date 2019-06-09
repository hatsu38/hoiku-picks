# frozen_string_literal: true

require 'rails_helper'

describe PicksController, type: :controller do
  before :each do
    request.headers['accept'] = 'application/javascript'
  end

  describe 'post #create' do
    let(:article) { create(:article) }
    let(:user) { create(:user) }
    it 'work' do
      allow(controller).to receive(:current_user).and_return(user)
      expect {
        post :create, params: { pick: { comment: 'Test' }, article_id: article.id }
      }.to change(Pick, :count).by(1)
    end
  end
end
