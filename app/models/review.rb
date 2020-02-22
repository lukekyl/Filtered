class Review < ApplicationRecord
    belongs_to :user
    belongs_to :coffeee, inverse_of: :reviews
    validates :rating, presence: true



    #Scope Methods
       
    def self.by_category(category)
        self.joins(:coffeee).where(:coffeees => {:category => category})
    end

    def self.by_roast(roast)
        self.joins(:coffeee).where(:coffeees => {:roast => roast})
    end

    def self.by_body(body)
        self.joins(:coffeee).where(:coffeees => {:body => body})
    end

    def self.by_acidity(acidity)
        self.joins(:coffeee).where(:coffeees => {:acidity => acidity})
    end

    def self.last_eight
        last(8).reverse
    end

end
