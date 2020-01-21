RSpec.feature "Timeline", type: :feature do
  scenario "Can view date and time of post" do
    sign_up('test1@example.com', 'testone')
    new_post("Hello")
    now = DateTime.now
    expect(page).to have_current_path '/posts'
    expect(page).to have_content(now.strftime("%d %b %C%y %H:%M:%S"))
  end
end
