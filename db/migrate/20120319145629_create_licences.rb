class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :name
      t.text :licence

      t.timestamps
    end
  end
end
