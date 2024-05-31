class AddNamePointsRankingToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :points, :integer, default: 0
    add_column :users, :ranking, :integer
  end
end
