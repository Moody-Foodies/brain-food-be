class CreateNutrients < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.string :health_benefits

      t.timestamps
    end
  end
end
