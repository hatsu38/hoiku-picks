# frozen_string_literal: true

class PicksController < ApplicationController
  def create
    pick = current_user.picks.build do |t|
      t.article_id = params[:article_id]
      t.comment = params[:pick][:comment]
    end
    if pick.save
      @article = pick.article
    else
      redirect_back(fallback_location: article_path(params[:article_id]))
    end
  end
end
