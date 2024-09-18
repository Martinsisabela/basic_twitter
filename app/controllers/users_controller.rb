class UsersController < ApplicationController
    def index
        render(json: User.all)
    end

    def show
    @user = User.find(params[:id])
    render json: @user
    end

    def create 
        @user = User.new(user_params)
        if @user.save
             render json: @user, status: :created, location: @user_id
            # Consegui salvar
        else
            render :json,errors, status: :unprocessable_entity
            # Nao conseguiu salvar
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render :json
        end 
    end 

    def destroy
        @user = User.find(params[:id])
        #@user.tweets.destroy_all  
        @user.destroy
        
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end
end

