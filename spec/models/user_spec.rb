# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '.create' do
    it '生成できる' do
      expect(create(:user).id).to be_present
    end
  end

  describe 'validation' do
    it 'validationが効いてること' do
      expect(create(:user)).to be_valid
    end

    context 'name is nill' do
      let(:user) { build(:user, name: '') }
      it 'is not be valid without name' do
        expect(user).to be_invalid
      end
    end
  end
end
