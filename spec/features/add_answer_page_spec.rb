require 'rails_helper'
require_relative './log_in_and_out_page_spec'

describe 'the answering a question path' do
  it 'adds a users answer to a question' do
    user = set_current_user
    question = FactoryGirl.create :question
    visit user_question_path(user, question)
    click_link "Add Answer"
    fill_in 'Content', :with => "Test answer"
    click_button "Add Answer"
    expect(page).to have_content "Answer added"
  end

end
