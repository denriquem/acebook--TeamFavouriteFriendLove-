RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up('test1@example.com', 'testone')
    new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
  end
end
