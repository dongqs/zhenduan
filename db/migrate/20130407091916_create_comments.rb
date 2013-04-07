class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :blog
      t.string :email
      t.text :content

      t.timestamps
    end
    add_index :comments, :blog_id
  end
end
