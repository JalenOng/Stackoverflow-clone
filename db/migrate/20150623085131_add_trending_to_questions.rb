class AddTrendingToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :trending, :integer
  end
end
