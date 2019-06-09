# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authorization do
  let(:user) { create(:user) }
  let(:authorization) { create(:authorization, user: user) }
  describe '.create' do
    it '生成できる' do
      expect(create(:authorization).id).to be_present
    end
  end

  describe 'validation' do
    it 'validationが効いてること' do
      expect(create(:authorization)).to be_valid
    end
    context 'name is nill' do
      let(:authorization) { build(:authorization, provider: '') }
      it 'is not be valid without provider' do
        expect(authorization).to be_invalid
      end
    end
  end
end
