class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :subject
      t.text :body
      t.references :video, index: true

      t.timestamps
    end
  end
end
