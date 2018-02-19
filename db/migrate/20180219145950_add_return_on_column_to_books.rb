class AddReturnOnColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :return_on, :date
  end
end
