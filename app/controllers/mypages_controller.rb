class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @q = current_user.posts.ransack(params[:q]) # ransackを使用している場合
    @posts = @q.result(distinct: true).page(params[:page]).order('created_at desc')
  end
end
