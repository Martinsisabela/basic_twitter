class TweetsController < ApplicationController
    
    def index
        render(json: Tweet.all)
    end
  
    def show
        @tweet = Tweet.find(params[:id])
   
        if @tweet.present?
        render json: @tweet
        else
        render json: { error: 'Tweet Not found' }, status: :not_found
        end
    end
  
    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
             render json: @tweet, status: :created, location: @tweet_id
            
        else
            render :json,errors, status: :unprocessable_entity
        end
    end
  
    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            render json: @tweet
        else
        render :json.errors, status: :unprocessable_entity
        end
    end
  
    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy
    
      render json: { error: "Tweet not found" }, status: :not_found
    end
  
    private

  
    def tweet_params
        params.require(:tweet).permit(:text, :user_id)
    end
end
