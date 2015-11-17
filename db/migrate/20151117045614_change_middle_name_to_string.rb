class ChangeMiddleNameToString < ActiveRecord::Migration
  def change
    change_column :contacts, :middle_name, :string
  end
end
