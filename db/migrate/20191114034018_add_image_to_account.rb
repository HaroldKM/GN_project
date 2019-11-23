class AddImageToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :image, :string, default: "ubuntu-550x309.jpg"
    add_column :accounts, :description, :text
    add_column :accounts, :website, :string

  end
end
