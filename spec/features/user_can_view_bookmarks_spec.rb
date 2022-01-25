feature "View bookmarks" do
  scenario "a user can visit /bookmarks and view their bookmarks" do
    visit "/bookmarks"
    expect(page).to have_content("https://www.bbc.co.uk/")
    expect(page).to have_content("https://www.google.com/")
    expect(page).to have_content("https://www.youtube.com/")
  end
end
