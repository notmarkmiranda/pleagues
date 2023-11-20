class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.integer :role, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
