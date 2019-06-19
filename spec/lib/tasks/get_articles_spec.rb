# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe 'rake task' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require('get_articles', [Rails.root.join('lib', 'tasks')])
    Rake::Task.define_task(:environment)
  end

  describe 'get_article:yahoo' do
    let!(:media) { create(:media, name: 'Yahoo') }
    subject { @rake['get_article:yahoo'].execute }

    it 'work' do
      expect { subject }.to change(Article, :count).by(10)
    end
  end

  describe 'get_article:hoikushi_bank' do
    let!(:media) { create(:media, name: '保育士バンク') }
    subject { @rake['get_article:hoikushi_bank'].execute }

    it 'work' do
      expect { subject }.to change(Article, :count).by(21)
    end
  end

  describe 'get_article:hoikuru' do
    let!(:media) { create(:media, name: 'ほいくる') }
    subject { @rake['get_article:hoikuru'].execute }

    it 'work' do
      expect { subject }.to change(Article, :count).by(34)
    end
  end

  describe 'get_article:sugoii_hoiku' do
    let!(:media) { create(:media, name: 'スゴいい保育') }
    subject { @rake['get_article:sugoii_hoiku'].execute }

    it 'work' do
      expect { subject }.to change(Article, :count).by(15)
    end
  end
end
