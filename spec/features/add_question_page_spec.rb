require 'rails_helper'

def pose_question(heading = 'Whoo?', content = 'I was just wondering...')
  set_current_user
  click_link 'Post Question'
  fill_in 'Heading', with: heading
  fill_in 'Content', with: content
  click_button 'Add Question'
end

describe 'adding a question' do
  it 'adds a question' do
    pose_question
    expect(page).to have_content 'added'
  end
end

# describe 'editing a question' do
#   it 'edits a users existing question' do
#     pose_question
#     click_button 'Edit'
#     fill_in 'Heading', with: "Edited Heading"
#     fill_in 'Content', with: "Edited Content"
#     click_button 'Save'
#     expect(page).to have_content 'Edited Heading'
#   end
# end
