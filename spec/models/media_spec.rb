# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Media do
  describe '.create' do
    it '生成できる' do
      expect(create(:media).id).to be_present
    end
  end

  describe 'validation' do
    it 'validationが効いてること' do
      expect(create(:media)).to be_valid
    end

    context 'name is nill' do
      let(:media) { build(:media, name: '') }
      it 'is not be valid without name' do
        expect(media).to be_invalid
      end
    end
  end
end
