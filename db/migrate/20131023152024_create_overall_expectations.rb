class CreateOverallExpectaions < ActiveRecord::Migration
  def change
    create_table :overall_expectations do |t|
      t.string :long_form
      t.string :short_form
      t.string :number
      t.integer :unit_id

      t.timestamps
    end
  end
end
