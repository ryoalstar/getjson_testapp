class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.json :service_area_primary_service_area_code
      t.json :service_area_additional_service_area_codes
      t.string :excavator_company_name
      t.string :excavator_address
      t.text :digsite_info_well_known_text

      t.timestamps null: false
    end
  end
end
