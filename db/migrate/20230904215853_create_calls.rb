class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.string :reason
      t.string :detail
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
