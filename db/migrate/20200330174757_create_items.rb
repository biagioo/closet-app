class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :brand
      t.string :size
      t.integer :user_id
    end
  end
end
