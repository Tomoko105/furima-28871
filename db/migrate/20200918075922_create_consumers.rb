class CreateConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :consumers do |t|
      t.string :postalcode, null: false
      t.integer :pref_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :buldname
      t.string :tel, null: false
      t.references :user_item, null: false
      t.timestamps
    end
  end
end
