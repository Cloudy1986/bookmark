feature "View bookmarks" do
  scenario "a user can visit /bookmarks and view their bookmarks" do
    visit "/bookmarks"
    expect(page).to have_content("http://www.makersacademy.com/")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com/")
  end
end
