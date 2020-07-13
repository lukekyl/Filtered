class UsersController < ApplicationController
    helper_method :to_stars, :make_stars

    def index
        @user = User.find(current_user.id)
        
        if !params[:favorite].blank?
            @reviews = Review.by_favorites(params[:favorite])
        elsif !params[:category].blank?
            @reviews = Review.by_category(params[:category])    
        elsif !params[:roast].blank?
            @reviews = Review.by_roast(params[:roast])
        elsif !params[:body].blank?
            @reviews = Review.by_body(params[:body])    
        elsif !params[:acidity].blank?
            @reviews = Review.by_acidity(params[:acidity])       
        else
            # if no filters are applied, show last eight reviews
            @reviews = Review.last_eight
        end
    end

    def show
        @user = User.find(current_user.id)
        @favorites = @user.reviews.by_favorites("Show Favorites")
    end


    private

    def make_stars
        # if self.rating == 4
        #     "<img class='review-stars' src='images/star.svg'>"
        # end
    end

    def to_stars(rating)
        # render :text => "<img class='review-stars' src='/public/images/star.png'>"
        # self.rating.times {stars << "<img class='review-stars' src='/public/images/star.svg'>"}
        # render :inline => stars
    end
end
