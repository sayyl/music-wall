class AddMusic < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :song_title
      t.string :author
      t.string :url
      t.datetime :created_at
      t.datetime :updated_at

    end
  end

end
