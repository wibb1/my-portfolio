class AddBlurbToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :blurb, :string, :limit => 110, null: false
  end
end
