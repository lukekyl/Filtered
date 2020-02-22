class ReviewsController < ApplicationController

    def index #admin only
    end
    
    def new 
        @coffeee = Coffeee.find(params[:coffeee_id])
        @review = Review.new
    end
    def create 
        @coffeee = Coffeee.find(params[:coffeee_id])
        @review = @coffeee.reviews.build(review_params)
        if @review.save
            flash[:green] = "Review Was Created!"
            redirect_to coffeee_path(@coffeee)
        else
            flash[:red] = "Review Could Not Be Created."
            redirect_to coffeee_path(@coffeee)
        end
    end

    def show
        @coffeee = Coffeee.find(params[:coffeee_id])
        @review = Review.find(params[:id])
    end

    def edit #user only
    end
    def update #user only
    end

    def destroy #user/admin only
    end

    private
    def review_params
        params.require(:review).permit(:coffeee_id, :user_id, :rating, :style, :recipe, :adatives, :favorite,  :details)
    end

end
