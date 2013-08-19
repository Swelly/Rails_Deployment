class CreateFires < ActiveRecord::Migration
  def change
    create_table :fires do |t|

      t.timestamps
    end
  end
end
