# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like do
  describe '.create' do
    it '生成できる' do
      expect(create(:like).id).to be_present
    end
  end

  describe 'validation' do
    it 'validationが効いてること' do
      expect(create(:like)).to be_valid
    end

    context 'user_id is nil' do
      let(:like) { build(:like, user: nil) }
      it 'user_idが必須' do
        expect(like).to be_invalid
      end
    end

    context 'pick_id is nil' do
      let(:like) { build(:like, pick: nil) }
      it 'pick_idが必須' do
        expect(like).to be_invalid
      end
    end
  end
end
