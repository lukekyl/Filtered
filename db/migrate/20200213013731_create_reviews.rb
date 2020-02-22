class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :style
      t.string :recipe
      t.string :addatives
      t.string :details
      t.boolean :favorite, default: false, null: false
      t.belongs_to :user
      t.belongs_to :coffeee

      t.timestamps
    end
  end
end
