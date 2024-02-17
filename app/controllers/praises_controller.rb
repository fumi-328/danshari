class PraisesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.praise(@post)
  end

  def destroy
    @post = current_user.praises.find(params[:id]).post
    current_user.unpraise(@post)
  end
end
