class CreateInteracciones < ActiveRecord::Migration[7.0]
  def change
    create_table :interacciones do |t|
      t.belongs_to :user, foreign_key: true, null: true
      t.belongs_to :cupon, foreign_key: true, null: true
      t.string :like, null: true

      t.timestamps
    end
  end
end
