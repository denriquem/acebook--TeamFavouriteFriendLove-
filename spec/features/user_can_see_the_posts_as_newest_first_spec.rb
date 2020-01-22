RSpec.feature "Timeline", type: :feature do
  scenario "User can submit posts and view them in reverse chronological order" do
    sign_up('test1@example.com', 'testone')
    new_post("Hello, world!")
    time_for_hello = DateTime.now.strftime("%d %b %C%y %H:%M:%S")
    sleep(5)
    visit "/posts"
    new_post("Goodbye, world!")
    time_for_goodbye = DateTime.now.strftime("%d %b %C%y %H:%M:%S")
    expect(page.text).to have_content("Goodbye, world! #{time_for_goodbye} Edit Delete Hello, world! #{time_for_hello}")
  end
end
