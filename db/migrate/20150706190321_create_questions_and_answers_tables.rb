class CreateQuestionsAndAnswersTables < ActiveRecord::Migration
  # And comments tables
  def change
    create_table :questions do |t|
      t.string :heading
      t.text :content
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end

    create_table :answers do |t|
      t.text :content
      t.integer :question_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end

    create_table :question_comments do |t|
      t.text :content
      t.integer :question_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end

    create_table :answer_comments do |t|
      t.text :content
      t.integer :answer_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
