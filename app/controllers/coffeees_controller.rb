class CoffeeesController < ApplicationController
    
    def new #done by adding review?
        @coffeee = Coffeee.new
    end
    def create #done by adding review?
        @coffeee = Coffeee.create(coffeee_params)
        # raise coffeee_params.inspect
        if @coffeee.save

            flash[:green] = "Coffee Was Created!"
            redirect_to coffeee_path(@coffeee)
        else
            flash[:red] = "Coffee Could Not Be Created"
            redirect_to new_coffeee_path
        end
    end

    def index
            @coffeees = Coffeee.all
    end

    def show
        @coffeee = Coffeee.find(params[:id])
    end

    def edit #admin only
    end
    def update #admin only
    end

    def destroy #admin only - filter options to delete by not having a review?
    end

    private
    def coffeee_params
        params.require(:coffeee).permit(:name, :category, :roast, :body, :acidity, reviews_attributes: [:user_id, :rating, :style, :recipe, :adatives, :favorite,  :details], brand_attributes: [:name, :location])
    end
end
