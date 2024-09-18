class RepostsController < ApplicationController
    def index
        @reposts = Tweet.find(params[:tweet_id]).reposts
        render json: @reposts
    end

    def show
        @repost = Repost.find(params[:id])

        if @repost.present?
        render json: @repost
        else 
        render :json,errors, status: :unprocessable_entity
        end
    end


    def create
        @repost = Repost.new(repost_params)
        
        if @repost.save
            render json: @repost, status: :created
        else
            render json: @repost.errors, status: :unprocessable_entity
        end
    end

      private
    
    def repost_params
        params.require(:repost).permit(:user_id, :tweet_id)
    end
end

