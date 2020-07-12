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
         if !params[:name].blank?
            @coffeees = Coffeee.by_name(params[:name])
         else
            # if no filters are applied, show last twelve coffees
            @coffeees = Coffeee.last_twelve
        end   
    end

    def show
        @coffeee = Coffeee.find(params[:id])
    end

    def edit #admin only
        @coffeee = Coffeee.find(params[:id])
    end
    def update #admin only
        @coffeee = Coffeee.find(params[:id])
        @coffeee.update(coffeee_params)
        redirect_to coffeee_path(@coffeee)
    end

    def destroy #admin only - filter options to delete by not having a review?
        @coffeee = Coffeee.find(params[:id])
        @coffeee.reviews.each do |r|
            r.destroy
        end
        @coffeee.destroy
        redirect_to coffeees_path
    end

    private
    def coffeee_params
        params.require(:coffeee).permit(:name, :category, :roast, :body, :acidity, :imgurl, reviews_attributes: [:user_id, :rating, :style, :recipe, :adatives, :favorite,  :details], brand_attributes: [:name, :location])
    end
end
