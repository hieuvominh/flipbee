class CreateTrendings < ActiveRecord::Migration[6.0]
  def change
    create_table :trendings do |t|
      t.integer :zdaily
      t.integer :previous_daily_total
      t.integer :daily_total
      t.integer :zmonthly
      t.integer :previous_monthly_total
      t.integer :monthly_total

      t.timestamps
    end
  end
end
