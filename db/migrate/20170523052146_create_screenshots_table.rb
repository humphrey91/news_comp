class CreateScreenshotsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :screenshots_tables do |t|
      t.references :domain
      t.string :screenshot
      t.timestamps
    end
  end
end
