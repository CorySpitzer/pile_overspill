require 'rails_helper'
require_relative './log_in_and_out_page_spec'

describe 'the answering a question path' do
  it 'links to the new answer form' do
    user = set_current_user
    question = FactoryGirl.create :question
    visit user_question_path(user, question)
    click_link "Add Answer"
    expect(page).to have_content "Content"
  end

  it 'adds a users answer to a question' do
    user = set_current_user
    click_link "Post Question"
    fill_in 'Heading', :with=> "Test Question"
    fill_in "Content", :with=> "Test Content"
    click_button 'Add Question'
    click_link 'Add Answer'
    # question = FactoryGirl.create :question
    # binding.pry
    # visit new_answer_path(question)
    fill_in 'Content', :with => "Test answer"
    click_button "Add Answer"
    expect(page).to have_content "Test answer"
  end
end
