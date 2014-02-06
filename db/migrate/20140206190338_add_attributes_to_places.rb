class AddAttributesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :title, :string
    add_column :places, :icon_url, :string
  end
end
