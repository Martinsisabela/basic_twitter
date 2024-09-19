class LikesController < ApplicationController
    before_action :set_like, only: [:show, :update, :destroy]
    def index
        @likes = Like.all
        render json: @likes
      end

    def show
        render json: @like
    end

    def create 
        @like = Like.new(like_params)

        if @like.save
          render json: @like, status: :created
        else
          render json: @like.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @like.destroy
          render json: { message: 'Like deleted' }, status: :no_content
        else
          render json: { error: 'Unable to delete like' }, status: :unprocessable_entity
        end
    end

    def update
        if @like.update(like_params)
            render json: @like
        else
            render json: @like.errors, status: :unprocessable_entity
        end
    end
    
    def set_like
        @like = Like.find_by(id: params[:id])
        render json: { error: 'Like not found' }, status: :not_found unless @like
    end
    
    private

    def like_params
      params.require(:like).permit(:tweet_id, :user_id)
    end
end

