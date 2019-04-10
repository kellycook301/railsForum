class PostsController < ApplicationController
    # the index controller will control the page that will display all of the posts from all of the users.
    # think of it as the Reddit homepage or something
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order("created_at DESC")
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
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    # requiring a title and content of the post
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
