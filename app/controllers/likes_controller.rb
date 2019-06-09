# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    like = current_user.likes.build(pick_id: params[:pick_id])
    @pick = like.pick
    if like.save
      @pick.update(like_count: @pick.like_count += 1)
    else
      redirect_back(fallback_location: article_path(@pick.article))
    end
  end

  def destroy
    like = current_user.likes.find_by(pick_id: params[:pick_id])
    @pick = like.pick
    if like.destroy
      @pick.update(like_count: @pick.like_count -= 1) if @pick.like_count != 0
    else
      redirect_back(fallback_location: article_path(@pick.article))
    end
  end
end
