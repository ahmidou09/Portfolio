class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :details
      t.string :poster_img
      t.text :technologies
      t.text :features
      t.text :images
      t.string :github_link
      t.string :live_link

      t.timestamps
    end
  end
end
