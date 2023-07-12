class CreateTimelines < ActiveRecord::Migration[7.0]
  def change
    create_table :timelines do |t|
      t.references :prev_user, null: false, foreign_key:  { to_table: :users }
      t.references :child_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
