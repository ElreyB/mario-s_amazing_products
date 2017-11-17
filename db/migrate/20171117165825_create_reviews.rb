class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content, :string
      t.column :rating, :integer
      t.column :product_id, :integer

      t.timestamps
    end
  end
end
