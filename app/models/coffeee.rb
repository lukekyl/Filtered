class Coffeee < ApplicationRecord
    has_many :reviews, inverse_of: :coffeee
    has_many :users, through: :reviews
    belongs_to :brand, optional: true
    accepts_nested_attributes_for :reviews
    validates :name, presence: true

    CATEGORIES = ["Arabica", "Robusta", "Liberica", "Excelsa"]
    ROASTS = ["Light", "Medium", "Dark"]
    BODYS = ["Medium", "Mid", "Full"]
    ACIDITIES = ["Low","Medium", "High"]

    #Brand Params
    def brand_attributes=(brand_attributes)
        if brand_attributes[:name] && !brand_attributes[:name].empty?
            set_brand(brand_attributes)
        end
    end

    def set_brand(brand_attributes)
        self.brand = Brand.where(name: brand_attributes[:name]).first_or_create do |b|
            b.name = brand_attributes[:name]
            b.location = brand_attributes[:location]
        end
    end


    #Scope Methods



end
