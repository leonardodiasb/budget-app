class CreateGroupEntity < ActiveRecord::Migration[6.1]
  def change
    create_table :group_entities do |t|
      t.references :group, null: false, foreign_key: true
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
