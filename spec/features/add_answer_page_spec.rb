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

  # it 'adds a users answer to a question' do
  #   user = set_current_user
  #   question = FactoryGirl.create :question
  #   fill_in 'Content', :with => "Test answer"
  #   click_button "Add Answer"
  #
  # end
end
