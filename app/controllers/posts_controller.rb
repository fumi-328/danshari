class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page]).order('created_at desc')
  end

  def new
    @post = Post.new
  end

  def create
    # フォームから送信されたパラメーターに deadline が含まれている場合、その値を更新する
    @post = if params[:post][:deadline].blank?
              current_user.posts.build(post_params.except(:deadline))
            else
              current_user.posts.build(post_params)
            end

    if @post.save
      redirect_to posts_path, success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    # フォームから送信された deadline の値を取得し、空の場合は nil を設定する
    deadline = params[:post].delete(:deadline)

    # deadline の値が空の場合は nil を設定する
    @post.update(post_params.merge(deadline: deadline.blank? ? nil : deadline, discard_flag: false))

    if @post.save
      redirect_to posts_path, success: t('defaults.flash_message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, success: t('defaults.flash_message.deleted', item: Post.model_name.human),
                            status: :see_other
  end

  def change_discard_flag
    @post = Post.find(params[:id])
    @post.update(discard_flag: true)
    redirect_to @post, success: t('defaults.flash_message.discard_flag', item: Post.model_name.human)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :deadline, :post_image, :post_image_cache)
  end
end
