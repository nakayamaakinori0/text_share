class CreateSharedTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_texts do |t|
      t.text :content

      t.timestamps
    end
  end
end
