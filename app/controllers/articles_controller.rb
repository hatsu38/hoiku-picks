# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.order(id: :desc).limit(20)
  end

  def show
    @article = Article.find(params[:id])
  end
end
