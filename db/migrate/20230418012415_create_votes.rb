class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cupon, null: false, foreign_key: true
      t.boolean :voted, null: false, default: false

      t.timestamps
    end
  end
end
