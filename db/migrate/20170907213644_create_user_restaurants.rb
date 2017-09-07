class CreateUserRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :user_restaurants do |t|
      t.datetime :date
      t.user :belongs_to
      t.restaurant :belongs_to

      t.timestamps
    end
  end
end
