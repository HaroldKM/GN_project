class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.references :account
      t.string :comment
      t.timestamps null: false 
    end
  end
end
