class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :source, polymorphic: true, index: true

      t.integer :user_id
      t.timestamps
    end
  end
end
