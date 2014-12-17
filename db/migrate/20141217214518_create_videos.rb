class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_url
      t.text :description

      t.timestamps
    end
  end
end
