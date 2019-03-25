class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :user
      t.text :title
      t.text :ingredient_blob
      t.text :ingredients, array: true
      t.text :directions
      t.text :cooking_time
      t.text :image_url
      t.text :source_url
      t.timestamps
    end
  end
end
