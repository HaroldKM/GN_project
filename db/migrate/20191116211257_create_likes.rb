class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :account
      t.references :post
      t.timestamps null: false
    end
  end
end
