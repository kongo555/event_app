class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false, default: ""
      t.datetime :start_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :capacity, null: false, default: 0

      t.timestamps
    end
  end
end
