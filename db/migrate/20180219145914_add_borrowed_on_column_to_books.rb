class AddBorrowedOnColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :borrowed_on, :date
  end
end
