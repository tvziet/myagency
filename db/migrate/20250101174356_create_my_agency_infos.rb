class CreateMyAgencyInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :my_agency_infos do |t|
      t.string :email
      t.string :address
      t.string :english_address
      t.string :phone_number
      t.string :facebook_name
      t.string :facebook_link

      t.timestamps
    end
  end
end
