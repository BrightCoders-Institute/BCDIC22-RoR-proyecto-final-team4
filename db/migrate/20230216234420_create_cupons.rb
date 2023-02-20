class CreateCupons < ActiveRecord::Migration[7.0]
  def change
    create_table :cupons do |t|
      t.belongs_to :user, foreign_key: true
      t.string :url
      t.string :title
      t.string :description
      t.string :location
      t.string :image_url
      t.string :normal_price
      t.string :discount_price
      t.string :discount_percentage
      t.string :coupon
      t.integer :punctuation
      t.string :type
      t.datetime :start_date
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
