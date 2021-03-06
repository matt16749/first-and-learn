class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, :null => false
      t.boolean :vote_state, :null => false
      t.string :voteable_type, :null => false
      t.integer :voteable_id, :null => false
    end
  end
end
