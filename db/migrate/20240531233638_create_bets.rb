class CreateBets < ActiveRecord::Migration[7.1]
  def change
    create_table :bets do |t|
      t.integer :value
      t.string :predicted_result
      t.string :actual_result
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
