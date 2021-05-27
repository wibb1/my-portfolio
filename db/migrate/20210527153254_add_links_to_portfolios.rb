class AddLinksToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :github_link, :string, limit: 110, default: "Please_Change", null: false
    add_column :portfolios, :deployed_link, :string, limit: 110
  end
end
