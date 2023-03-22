class AddCategoryIdToCupons < ActiveRecord::Migration[7.0]
  def change
    add_column :cupons, :category_id, :bigint, null: true
  end
end
