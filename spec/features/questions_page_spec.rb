require 'rails_helper'
require_relative './log_in_and_out_page_spec'

describe 'the questions page' do
  it 'lists questions in order' do
    user = set_current_user
    question1 = user.questions.create heading: 'What?!', content: 'Yeaeh!'
    question2 = user.questions.create heading: 'why?', content: 'no'
    visit root_path
    expect(page).to have_content ": #{question2.heading} #{question1.heading}"

  end
end
