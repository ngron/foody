class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :reply, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
