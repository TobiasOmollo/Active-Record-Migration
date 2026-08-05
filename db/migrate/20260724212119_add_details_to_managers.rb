class AddDetailsToManagers < ActiveRecord::Migration[8.1]
  def change
    add_reference :managers, :team, type: :uuid, foreign_key: true
    add_column :managers, :nationality, :text
    add_column :managers, :appointed_on, :date
    add_column :managers, :status, :integer, default: 0
  end
end
