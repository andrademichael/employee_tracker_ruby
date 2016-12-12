class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:divisions) do |t|
      t.column(:name, :string)
    end
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:division_id, :int)
    end
  end
end
