class CreateDomainsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :domains_tables do |t|
      t.string :host
      t.timestamps
    end
  end
end
