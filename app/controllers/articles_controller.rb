# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @medias = Media.all.limit(4)
  end

  def show
    @article = Article.find_by(id: params[:id])
    @feature_pick = Pick.where(id: params[:pick_id])

    impressionist(@article, nil, unique: [:session_hash])
  end
end
