class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
