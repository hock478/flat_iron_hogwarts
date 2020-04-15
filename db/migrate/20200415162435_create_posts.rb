class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :house_id
      t.text :content
      t.date :posted

      t.timestamps
    end
  end
end
