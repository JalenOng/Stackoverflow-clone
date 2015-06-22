class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :source, polymorphic: true, index: true
      t.integer :user_id
      t.timestamps
    end
  end
end
