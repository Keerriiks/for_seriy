class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :search]
  
    def index
      @posts = Post.all.order(created_at: :desc)
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        puts "Image: #{@post.image.inspect}"  # Добавьте эту строку для отладки

        redirect_to @post, notice: 'Post was successfully created.'
      else
        puts "Errors: #{@post.errors.full_messages}"  # И эту строку тоже

        render :new
      end
    end
  
    def search
      @posts = Post.where("content LIKE ?", "%#{params[:query]}%")
      render :index
    end
  
    private
  
    def post_params
      params.require(:post).permit(:content, :image)
    end
  end