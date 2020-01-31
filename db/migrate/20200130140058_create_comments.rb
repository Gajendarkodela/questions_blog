class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.integer :comment_type, default: 0
      t.bigint  :commentable_id
      t.string  :commentable_type

      t.timestamps
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
