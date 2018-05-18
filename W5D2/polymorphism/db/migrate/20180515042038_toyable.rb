class Toyable < ActiveRecord::Migration[5.1]
  def create_table
      create_table :toyable do |t|
        t.string :name, null: false

        t.timestamps
      end
    end
  end

  end
end
