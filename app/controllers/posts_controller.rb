class PostsController < ApplicationController

	def index
		#displays all the posts

		#Note the @posts is plural => Helps know its 
		#it will show all
		@posts = Post.all
	end

	def new
		#renders a form
		@post = Post.new
	end


	def show
		#finds single post with its ID
		@post = Post.find(params[:id])
	end

	#saves the post and redirects
	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to @post
	end

	def edit
		# find post with ID
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		#updates secure params (:title, :body) from the Strong Params
		if @post.update(params[:post].permit(:title, :body))
			#redirects to post if updated is confirmed
			redirect_to @post
		else
			#render new dosent lose all the data already in the form
			render 'new'
		end
	end

	def destroy
		#find post with ID
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	#These are Strong Parameters
	private

	def post_params
		#these are perameters that are only permited in the post
		#if someone tries to add unwanted data this will not accept it
		params.require(:post).permit(:title, :body)
	end
end
