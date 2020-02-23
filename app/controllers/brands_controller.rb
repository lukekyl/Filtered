class BrandsController < ApplicationController

    
    def new #done by adding review or through Coffee?

    end
    def create #done by adding review or through Coffee?
        @coffeee = Coffeee.find(brand_params[:coffeee_id])
        @brand = @coffeee.set_brand(brand_params)
        if @brand.save
            @coffeee.save
            flash[:green] = "Brand Was Added!"
            redirect_to coffeee_path(@coffeee)
        else
            flash[:red] = "Brand Could Not Be Added."
            redirect_to coffeee_path(@coffeee)
        end
    end

    def show # lists brands coffee
        @brand = Brand.find(params[:id])
    end

    def edit #admin only
        @brand = Brand.find(params[:id])
    end
    def update #admin only
        @brand = Brand.find(params[:id])
        @brand.update(brand_params)
        redirect_to brand_path(@brand)
    end

    def destroy #admin only
        @brand = Brand.find(params[:id])
        @brand.destroy
        redirect_to coffeees_path
    end

    private
    def brand_params
        params.require(:brand).permit(:coffeee_id, :name, :location)
    end

end
