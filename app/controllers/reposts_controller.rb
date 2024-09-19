class RepostsController < ApplicationController
    before_action :set_repost, only: [:update, :destroy]
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

    def destroy
        @repost.destroy
        render json: { message: 'Repost deleted' }, status: :no_content
    end

    def update
       
        if @repost.update(repost_params)
          render json: { message: 'updated Repost ', repost: @repost }, status: :ok
        else
          render json: { error: @repost.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def set_repost
        @repost = Repost.find_by(id: params[:id])
        render json: { error: 'Repost not found' }, status: :not_found unless @repost
      end
      private
    
    def repost_params
        params.require(:repost).permit(:user_id, :tweet_id)
    end
end

