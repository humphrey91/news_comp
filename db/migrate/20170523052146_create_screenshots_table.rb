class CreateScreenshotsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :screenshots do |t|
      t.references :domain
      t.string :filename
      t.timestamps
    end
  end
end
