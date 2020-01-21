require 'rails_helper'

def sign_up(email, password)
  visit('/sign_up')
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_on 'Sign up'
end

def new_post(message)
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
