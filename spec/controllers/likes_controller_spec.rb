# frozen_string_literal: true

require 'rails_helper'

describe LikesController, type: :controller do
  before :each do
    request.headers['accept'] = 'application/javascript'
    allow(controller).to receive(:current_user).and_return(user)
  end
  let(:user) { create(:user) }
  let(:pick) { create(:pick, like_count: 1) }

  describe 'post #create' do
    it 'work' do
      expect {
        post :create, params: { pick_id: pick.id }
      }.to change(Like, :count).by(1)
      expect(assigns(:pick).like_count).to eq 2
    end
  end

  describe 'delete #destroy' do
    let!(:like) { create(:like, pick: pick, user: user) }
    subject { delete :destroy, params: { pick_id: pick.id } }
    it 'work' do
      expect { subject }.to change(Like, :count).by(-1)
      expect(assigns(:pick).like_count).to eq 0
    end

    context 'like_count = 0' do
      let(:zero_like_pick) { create(:pick, like_count: 0) }
      it 'work' do
        subject
        expect(assigns(:pick).like_count).to eq 0
      end
    end
  end
end
