class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end


	def show
		@post = Post.find(params[:id])
	end

	#saves the post and redirects
	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to @post
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end


	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end