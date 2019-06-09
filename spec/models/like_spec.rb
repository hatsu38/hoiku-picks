# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like do
  let(:user) { create(:user) }
  let(:pick) { create(:pick) }
  let(:like) { create(:like, pick: pick, user: user) }

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
      let(:like) { build(:like, pick: pick, user: nil) }
      it 'user_idが必須' do
        expect(like).to be_invalid
      end
    end

    context 'pick_id is nil' do
      let(:like) { build(:like, pick: nil, user: user) }
      it 'pick_idが必須' do
        expect(like).to be_invalid
      end
    end
  end
end
