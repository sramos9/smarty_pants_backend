class PostsController < ApplicationController
  before_action  only: [ :index, :show, :update, :destroy]


  # GET /posts
  def index
    @posts = Post.all

    render json: @posts.to_json(include: :comments)

  end

  # GET /posts/1
  def show
    @posts = Post.find(params[:id])

    render json: @posts.to_json(include: :comments)
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created

    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:username, :title, :content)
    end
end
