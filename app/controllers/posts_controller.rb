class PostsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :new, :create, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def home
  end

  def index
    #@posts = Post.all.paginate(:page => params[:page], :per_page => 9)
  end

  def show
  end

  def new
    @post = @project.posts.build
  end

  def edit
  end

  def create
   @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @project, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @project, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def correct_user
      @post = current_user.posts.find_by(id:params[:id])
      redirect_to post_path, notice: "not authorized to edit this post" if @post.nil?
    end

    def post_params
      params.require(:post).permit(:description, :title, :image, :project_id)
    end
end
