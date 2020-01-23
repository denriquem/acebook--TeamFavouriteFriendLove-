feature 'sign up' do
  scenario 'user can sign up with email and password' do
    sign_up('dan@test.com', 'testone')
    expect(page).to have_current_path '/'
    expect(page).to have_content 'Signed in as: dan@test.com'
  end

  scenario 'user put less than 6 characters for password' do
    visit '/sign_up'
    fill_in 'user_email', with: 'dan@test.com'
    fill_in 'user_password', with: 'p12'
    fill_in 'confirmation-password', with: 'p12'
    click_on 'Sign up'
    expect(page).to have_content 'password would require 6-10 characters'
  end

  scenario 'user put more than 10 characters for password' do
    visit '/sign_up'
    fill_in 'user_email', with: 'dan@test.com'
    fill_in 'user_password', with: 'p12234567789'
    fill_in 'confirmation-password', with: 'p12234567789'
    click_on 'Sign up'
    expect(page).to have_content 'password would require 6-10 characters '
  end

  scenario 'user password confirmation not the same' do
    visit '/sign_up'
    fill_in 'user_email', with: 'dan@test.com'
    fill_in 'user_password', with: 'p122345'
    fill_in 'confirmation-password', with: 'p1223455699'
    click_on 'Sign up'
    expect(page).to have_content 'passwords not the same'
  end
end
