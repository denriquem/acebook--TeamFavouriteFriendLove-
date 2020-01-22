RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up('test1@example.com', 'testone')
    new_post("Hahahaha")
    expect(page).to have_content("test1@example.com")
  end
end
