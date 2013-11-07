class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, :urlsm, :urllg
      t.text :description

      t.timestamps
    end
  end
#  def up
#  end

#  def down
#  end
end
