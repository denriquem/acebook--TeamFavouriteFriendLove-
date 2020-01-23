RSpec.feature "Timeline", type: :feature do
  scenario "Can view who posted each post" do
    sign_up('shaf@example.com', 'testone')
    new_post("Hahahaha")
    click_button 'Sign out'
    sign_up('test2@example.com', 'testtwo')
    new_post('Old message from test 2')
    expect(page).to have_content("shaf@example.com")
  end
end
