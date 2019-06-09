# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pick do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:pick) { create(:pick, article: article, user: user) }

  describe '.create' do
    it '生成できる' do
      expect(create(:pick).id).to be_present
    end
  end

  describe 'validation' do
    it 'validationが効いてること' do
      expect(create(:pick)).to be_valid
    end

    context 'user_id is nil' do
      let(:pick) { build(:pick, article: article, user: nil) }
      it 'user_idが必須' do
        expect(pick).to be_invalid
      end
    end

    context 'article_id is nil' do
      let(:pick) { build(:pick, article: nil, user: user) }
      it 'article_idが必須' do
        expect(pick).to be_invalid
      end
    end
  end
end
