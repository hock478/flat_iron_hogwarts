class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :student_id
      t.integer :house_id
      t.date :posted

      t.timestamps
    end
  end
end
