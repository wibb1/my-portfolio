class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_header_topics, except: [:update, :create, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :update, :edit, :toggle_status]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.blogs_filter(current_user.role, params[:page],5)
    @page_title = "My Portfolio Blog"
    @featured_blogs = Blog.featured.limit(2)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published? || @blog.featured?
      @blog = Blog.includes(:comments).friendly.find(params[:id]) 
      @comment = Comment.new
      @page_title = "Blog Detail Page"
      @seo_keywords += @blog.body
    else
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @page_title = "Enter a new blog"
  end

  # GET /blogs/1/edit
  def edit
    @page_title = "Edit the blog"
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    @blog.published? ? (@blog.draft!) : (@blog.published!)
    redirect_to blogs_url, notice: 'Post Status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :status, :topic_id, :blurb)
    end

    def set_header_topics
      @header_topics = Topic.with_blogs
    end
end
