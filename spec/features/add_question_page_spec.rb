require 'rails_helper'

def set_current_user(user = nil)
  visit '/log-in'
  user = FactoryGirl.create :user
  fill_in 'email', :with => user.email
  fill_in 'password', :with => user.password
  click_button "Log in"
end

describe 'the Log in path' do
  it 'clicks log in' do
    visit '/'
    click_link 'Log In'
    expect(page).to have_content 'Log In:'
  end

  it 'authenticates and logs in the user' do
    set_current_user
    expect(page).to have_content "logged in!"
  end
end

describe 'the log out path' do
  it 'logs a user out of their account' do
    set_current_user
    click_link 'Log Out'
    expect(page).to have_content "logged out."
  end
end

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
