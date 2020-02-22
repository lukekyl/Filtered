class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(current_user.id)
        
        if !params[:category].blank?
            @reviews = Review.by_category(params[:category])
        elsif !params[:roast].blank?
            @reviews = Review.by_roast(params[:roast])
        elsif !params[:body].blank?
            @reviews = Review.by_body(params[:body])    
        elsif !params[:acidity].blank?
            @reviews = Review.by_acidity(params[:acidity])       
        else
            # if no filters are applied, show all posts
            @reviews = Review.last_eight
        end
        render template: 'users/index'
    end

    def show
        @user = User.find(current_user.id)
    end


end
