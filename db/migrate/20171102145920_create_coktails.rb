class CreateCoktails < ActiveRecord::Migration[5.0]
  def change
    create_table :coktails do |t|
      t.string :name

      t.timestamps
    end
  end
end
