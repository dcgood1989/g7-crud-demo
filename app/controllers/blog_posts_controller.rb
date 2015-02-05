class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    blog_post = BlogPost.new(blog_post_params)
    blog_post.save

    redirect_to blog_posts_path
  end

  def edit
    @blog_post= BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])

    if @blog_post.update(blog_post_params)
      redirect_to blog_posts_path
    else
      render :edit
    end
  end

  def destroy
    blog_posts = BlogPost.find(params[:id])
    blog_posts.destroy
    redirect_to blog_posts_path
  end


  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :author, :content)
  end
end
