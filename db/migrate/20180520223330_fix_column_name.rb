class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :type, :booktype
  end
end
