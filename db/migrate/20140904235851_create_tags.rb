class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :type, :null => false
    end
  end
end
