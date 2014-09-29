class CreateItems < ActiveRecord::Migration
  def change
    enable_extension 'hstore'

    create_table :items do |t|
      t.string :name
      t.text :description
      t.hstore :properties

      t.timestamps
    end
  end
end
