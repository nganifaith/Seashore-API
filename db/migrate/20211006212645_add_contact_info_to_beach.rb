class AddContactInfoToBeach < ActiveRecord::Migration[6.1]
  def change
    add_column :beaches, :email, :string
    add_column :beaches, :phone_number, :string
    add_column :beaches, :website, :string
  end
end
