class RemoveGenerationsFromRegion < ActiveRecord::Migration[7.1]
  def change
    remove_reference :regions, :generation, null: false, foreign_key: true
  end
end
