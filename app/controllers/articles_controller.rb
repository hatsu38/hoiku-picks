# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @medias = Media.all.limit(4)
  end

  def show
    @article = Article.find(params[:id])
  end
end
