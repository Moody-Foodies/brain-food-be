class CreateUserMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :user_moods do |t|
      t.integer :nutrient_id
      t.integer :user_id
      t.integer :mood_rating

      t.timestamps
    end
  end
end
