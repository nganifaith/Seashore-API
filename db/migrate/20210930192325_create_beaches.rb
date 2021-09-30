class CreateBeaches < ActiveRecord::Migration[6.1]
  def change
    create_table :beaches do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address
      t.integer :rating
      t.string :image
      t.string :details

      t.timestamps
    end
  end
end
