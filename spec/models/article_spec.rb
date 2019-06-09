# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  describe '.create' do
    it '生成できる' do
      expect(create(:article).id).to be_present
    end
  end

  describe 'validation' do
    it 'validationが効いてること' do
      expect(create(:article)).to be_valid
    end

    context 'title is nill' do
      let(:article) { build(:article, title: '') }
      it 'is not be valid without title' do
        expect(article).to be_invalid
      end
    end
  end

  describe '#mypick' do
    let(:current_user) { create(:user) }
    let(:article) { create(:article) }
    let!(:pick) { create(:pick, article: article, user: current_user) }

    subject { article.mypick(current_user) }

    it { is_expected.to eq pick }
  end
end
