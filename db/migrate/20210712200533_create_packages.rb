class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.string :tracking_number
      t.boolean :delivery_status
      t.belongs_to :courier, null: false, foreign_key: true
    end
  end
end
