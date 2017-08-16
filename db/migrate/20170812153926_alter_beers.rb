class AlterBeers < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :manufacturer, :string
    add_column :beers, :country, :string
    add_column :beers, :price, :decimal
  end
end