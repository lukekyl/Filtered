class CreateCoffeees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffeees do |t|
      t.string :name
      t.string :roast
      t.string :body
      t.string :acidity
      t.string :category
      t.belongs_to :brand

      t.timestamps
    end
  end
end
