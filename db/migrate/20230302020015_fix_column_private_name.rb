class FixColumnPrivateName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :type, :user_type
    rename_column :cupons, :type, :promotion_type
  end
end
