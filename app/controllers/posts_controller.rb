class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  if @post.save
	  	redirect_to post_path(@post)
		else
			render :new
		end
	end

	def update
	 if @post.update(post_params)
	  	redirect_to post_path(@post)
		else
			render :new
		end
	end

	def edit
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
