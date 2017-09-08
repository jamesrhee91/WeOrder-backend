class CreateUserRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :user_restaurants do |t|
      t.datetime :date
      t.belongs_to :user
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
