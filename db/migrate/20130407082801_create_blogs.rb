class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.string :status, :null => false

      t.timestamps
    end
    add_index :blogs, :status
  end
end
