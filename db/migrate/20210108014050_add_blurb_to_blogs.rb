class AddBlurbToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blurb, :string, :limit => 110, null: false
  end
end
