class CreateMoments < ActiveRecord::Migration[7.0]
  def change
    create_table :moments do |t|
      t.string :name

      t.timestamps
    end
  end
end
