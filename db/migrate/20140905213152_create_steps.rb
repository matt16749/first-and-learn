class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :body, :null => false
      t.integer :position, null: false, default: 1
      t.integer :path_id, :null => false
      t.integer :asset_id, :null => false
      t.timestamps
    end
  end
end
