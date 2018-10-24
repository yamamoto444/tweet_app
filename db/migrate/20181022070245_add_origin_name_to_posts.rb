class AddOriginNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :origin_name, :string
    add_column :posts, :origin_image_name, :string
    add_column :posts, :origin_content, :string
  end
end
