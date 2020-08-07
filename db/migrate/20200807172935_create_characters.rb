class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :external_id
      t.string :name
      t.string :description
      t.string :image_url
      
      t.timestamps
    end
  end
end
