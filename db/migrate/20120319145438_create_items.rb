class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :licence_id
      t.boolean :whole_object
      t.string :part_object
      t.string :user_first_name
      t.string :user_last_name
      t.string :user_email

      t.timestamps
    end
  end
end
