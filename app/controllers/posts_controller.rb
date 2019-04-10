class PostsController < ApplicationController
    # the index controller will control the page that will display all of the posts from all of the users.
    # think of it as the Reddit homepage or something
    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private

    # requiring a title and content of the post
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
