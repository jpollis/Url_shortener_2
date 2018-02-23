class AddRandomIdToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :random_id, :string
  end
end
