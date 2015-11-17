class AddMiddleName < ActiveRecord::Migration
  def change
    add_column :contacts, :middle_name, :text
  end
end
