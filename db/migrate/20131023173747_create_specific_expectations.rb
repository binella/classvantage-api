class CreateSpecificExpectations < ActiveRecord::Migration
  def change
    create_table :specific_expectations do |t|
      t.string :code
      t.string :description
      t.string :example
      t.string :friendly_description
      t.integer :overall_expectation_id

      t.timestamps
    end
  end
end
