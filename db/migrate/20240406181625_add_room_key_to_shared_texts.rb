class AddRoomKeyToSharedTexts < ActiveRecord::Migration[7.1]
  def change
    add_column :shared_texts, :room_key, :string
  end
end
