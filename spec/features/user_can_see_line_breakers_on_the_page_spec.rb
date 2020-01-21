RSpec.feature "Timeline", type: :feature do
  scenario "Can submit a post with a line break and view it on the post page" do
    sign_up('test1@example.com', 'testone')
    new_post("Test line break\nSecond line\nThird line")
    expect(page.html).to include("<p>Test line break\r<br>Second line\r<br>Third line</p>")
  end
end
