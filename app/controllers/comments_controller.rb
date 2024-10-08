class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    def index
        @comments = Comment.all
        render json: @comments
    end

    def show
        render json: @comment
    end

    def create
        @comment = Comment.new(comment_params)
    
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @comment.destroy
            render json: { message: 'Comment deleted'}, status: :no_content
        else
            render json: { error: 'Unable to delete Comment'}, status: :unprocessable_entity
        end
    end

    def update
        if @comment.update(comment_params)
            render json: @comment
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        render json: { error: 'Comment not Found'}, status: :not_found unless @comment
    end
    
    private

    def comment_params
        params.require(:comment).permit(:content, :tweet_id, :user_id)
    end
end
