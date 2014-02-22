class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :postcode
      t.string :county_state
      t.string :country
      t.string :website
      t.string :phone_number
      t.string :email
      t.text :mission_statement

      t.timestamps
    end
  end
end
