RSpec.feature "Timeline", type: :feature do
  before(:each) do
    sign_up('test1@example.com', 'testone')
    new_post("Hello From Test One")
  end

  scenario "User can delete their post" do
    click_link('Delete')
    expect(page).to_not have_content("Hello From Test One")
  end

  scenario "User can only delete their own posts" do
    click_button('Sign out')
    sign_up("test2@example.com", 'testtwo')
    new_post("Hello From Test Two")
    all('a', :text => 'Delete')[0].click
    expect(page).to have_content("Hello From Test One")
    expect(page).to_not have_content("Hello From Test Two")
  end

  scenario "User can not delete posts they do not own" do
    click_button('Sign out')
    sign_up("test2@example.com", 'testtwo')
    new_post("Hello From Test Two")
    all('a', :text => 'Delete')[1].click
    expect(page).to have_content("You are not logged in as the correct user")
    expect(page).to have_content("Hello From Test One")
    expect(page).to have_content("Hello From Test Two")
  end
  
end
