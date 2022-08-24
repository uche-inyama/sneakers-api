class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.text :image_data
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
